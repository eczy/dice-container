FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y ocaml ocamlbuild opam m4
RUN opam init --disable-sandboxing
RUN eval `opam config env`
RUN opam install -y ounit core ppx_sexp_conv sexplib core_bench menhir ppx_deriving camlidl

ADD mlcuddidil ./mlcuddidil
RUN eval `opam config env` && \
    cd mlcuddidil && \
    ./configure && \
    make && \
    make install
ADD dice ./dice
RUN eval `opam config env` && \
    cd dice && \
    make

RUN mkdir /workspace
WORKDIR /workspace
RUN cp /dice/Dice.native /workspace

CMD ["bash"]