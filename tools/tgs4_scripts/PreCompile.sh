#!/bin/bash

# REPO MAINTAINERS: KEEP CHANGES TO THIS IN SYNC WITH /tools/LinuxOneShot/SetupProgram/PreCompile.sh
# No ~mso
set -e
set -x

#load dep exports
#need to switch to game dir for Dockerfile weirdness
original_dir=$PWD
cd "$1"
. dependencies.sh
cd "$original_dir"

#find out what we have (+e is important for this)
set +e
has_git="$(command -v git)"
has_cargo="$(command -v ~/.cargo/bin/cargo)"
has_sudo="$(command -v sudo)"
has_grep="$(command -v grep)"
has_ytdlp="$(command -v yt-dlp)"
has_pip3="$(command -v pip3)"
set -e

# install cargo if needed
if ! [ -x "$has_cargo" ]; then
	echo "Installing rust..."
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	. ~/.profile
fi

# apt packages, libssl needed by rust-g but not included in TGS barebones install
if ! ( [ -x "$has_git" ] && [ -x "$has_grep" ] && [ -f "/usr/lib/i386-linux-gnu/libssl.so" ] ); then
	echo "Installing apt dependencies..."
	if ! [ -x "$has_sudo" ]; then
		dpkg --add-architecture i386
		apt-get update
		apt-get install -y git libssl-dev:i386
		rm -rf /var/lib/apt/lists/*
	else
		sudo dpkg --add-architecture i386
		sudo apt-get update
		sudo apt-get install -y git libssl-dev:i386
		sudo rm -rf /var/lib/apt/lists/*
	fi
fi
dpkg --add-architecture i386
apt-get update
apt-get install -y lib32z1 pkg-config libssl-dev:i386 libssl-dev libssl1.1:i386
# update rust-g
if [ ! -d "rust-g" ]; then
	echo "Cloning rust-g..."
	git clone https://github.com/tgstation/rust-g
	cd rust-g
	~/.cargo/bin/rustup target add i686-unknown-linux-gnu
else
	echo "Fetching rust-g..."
	cd rust-g
	git fetch
	~/.cargo/bin/rustup target add i686-unknown-linux-gnu
fi

echo "Deploying rust-g..."
git checkout "$RUST_G_VERSION"
env PKG_CONFIG_ALLOW_CROSS=1 ~/.cargo/bin/cargo build --release --target=i686-unknown-linux-gnu
mv target/i686-unknown-linux-gnu/release/librust_g.so "$1/librust_g.so"
cd ..

# Auxtools dependencies
apt-get install -y build-essential g++-multilib libc6-i386 libstdc++6:i386

# Update auxmos
if [ ! -d "auxmos" ]; then
	echo "Cloning auxmos..."
	git clone https://github.com/Putnam3145/auxmos
	cd auxmos
	~/.cargo/bin/rustup target add i686-unknown-linux-gnu
else
	echo "Fetching auxmos..."
	cd auxmos
	git fetch
	~/.cargo/bin/rustup target add i686-unknown-linux-gnu
fi

echo "Deploying auxmos..."
git checkout "$AUXMOS_VERSION"
env PKG_CONFIG_ALLOW_CROSS=1 ~/.cargo/bin/cargo rustc --release --target=i686-unknown-linux-gnu --features "all_reaction_hooks katmos" -- -C target-cpu=native
mv -f target/i686-unknown-linux-gnu/release/libauxmos.so "$1/libauxmos.so"
cd ..

# install or update yt-dlp when not present, or if it is present with pip3,
# which we assume was used to install it
if ! [ -x "$has_ytdlp" ]; then
	echo "Installing yt-dlp with pip3..."
	if ! [ -x "$has_sudo" ]; then
		apt-get install -y python3 python3-pip
	else
		sudo apt-get install -y python3 python3-pip
	fi
	pip3 install yt-dlp
elif [ -x "$has_pip3" ]; then
	echo "Ensuring yt-dlp is up-to-date with pip3..."
	pip3 install yt-dlp -U
fi

# compile tgui
echo "Compiling tgui..."
cd "$1"
chmod +x tools/bootstrap/node  # Workaround for https://github.com/tgstation/tgstation-server/issues/1167
env TG_BOOTSTRAP_CACHE="$original_dir" TG_BOOTSTRAP_NODE_LINUX=1 CBT_BUILD_MODE="TGS" tools/bootstrap/node tools/build/build.js
