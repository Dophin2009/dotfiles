# Traverse up the filesystem n times
up() {
  LIMIT=$1
  LIMIT=${LIMIT:-1}
  P=$PWD
  for ((i = 1; i <= LIMIT; i++)); do
    P=$P/..
  done
  cd $P
}
