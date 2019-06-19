FROM ubuntu:18.04 as llvm-project
RUN apt-get update && apt-get install -y \
    curl \
    xz-utils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# clangのpre-buildのダウンロード
WORKDIR /lib/llvm-project
RUN curl http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz --output llvm-project.tar.xz && \
    tar -xf llvm-project.tar.xz --strip-components 1 && \
    rm llvm-project.tar.xz

FROM ubuntu:18.04
WORKDIR /lib/llvm-project
COPY --from=llvm-project /lib/llvm-project .
