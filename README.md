# Erlang
Learning erlang master seed :D 

# Tutorial Install
1. Download `asdf` tool
2. Add .$HOME/.asdf/asdf.sh into ~/.zshrc
3. asdf plugin add erlang
4. asdf install erlang 17.0
5. asdf global erlang 17.0 

# Fix error when install into ubuntu >= 20.04
##1  gcc-7
sudo apt install gcc-7

##2 Tạo folder ${HOME}/Downloads/01_Tool/openssl
### Install openssl, clone về ${HOME}/Downloads/
1. git clone git@github.com:openssl/openssl.git --branch OpenSSL_1_0_2-stable
2. cd openssl/
3. mkdir __result
4. ./config --prefix="${HOME}/Downloads/01_Tool/openssl" shared zlib -fPIC
5. make depend
6. make
7. make install INSTALL_PREFIX="${HOME}/Downloads/01_Tool/openssl/__result"
