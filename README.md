# CRYPTO-101 / OpenSSL 101

This file has

* Set of openssl commands to generate key and certificate.
* Perform encryption and decryption using it.


## Generate a KEY

```sh
openssl genrsa -out server_2048.key 2048
openssl genrsa -out server_4096.key 4096
openssl genrsa -out server.key 2048
openssl genrsa -out ca.key 2048
```

## Generate a CSR from KEY

```sh
openssl req -out server.csr -key server.key -new
```

## Generate CSR and KEY (single command)

```sh
openssl req -out server.csr -new -newkey rsa:2048 -nodes -keyout server.key
```

```sh
openssl req -out ca.csr -new -newkey rsa:2048 -nodes -keyout ca.key
IN
KERALA
COCHIN
SECURE CAPIOT
SECURE DIVISION
odp.SECURE.com
secure@capiot.


```

## Display information within CSR

```sh
openssl req -in server.csr -verify -noout -text
openssl req -in ca.csr -noout -text
```

## Generate a CERT from CSR and self-sign it with the key

```sh
openssl x509 -signkey server.key -in server.csr -req -days 365 -out server.crt
openssl x509 -signkey ca.key -in ca.csr -req -days 365 -out ca.crt
```

## Generate a CERT from CSR and CA sign it

```sh
openssl ca -config openssl.cnf -policy signing_policy -extensions signing_req -out server_ca.crt -infiles server.csr
```

## Display information within CERT

```sh
openssl x509 -in server.crt -text -noout
openssl x509 -in server_ca.crt -text -noout
```


# Encrypting a file


## Generate a random key to encrypt

```sh
openssl rand -base64 32 > key.bin
```

## Encrypt the file 

```sh
openssl enc -aes-256-cbc -salt -in README.md -out README.md.enc -pass file:./key.bin
```

## Check file

```sh
file README.md
file README.md.enc
```

## Get the public key

```sh
openssl rsa -in server.key -out server.pub.pem -outform PEM -pubout
```

## Verify

```sh
openssl rsa -inform PEM -pubin -in server.pub.pem -text -noout
```

## Encrypt the random key with the public keyfile

```sh
openssl rsautl -encrypt -inkey server.pub.pem -pubin -in key.bin -out key.bin.enc
```

## Check file

```sh
file key.bin
file key.bin.enc
```

## Decrypt the random key with our private key file

```sh 
openssl rsautl -decrypt -inkey server.key -in key.bin.enc -out key.bin.out
```

## Decrypt the large file with the random key

```sh
openssl enc -d -aes-256-cbc -in README.md.enc -out README.md.out -pass file:./key.bin.out
```

## Check

```sh
md5sum README.md
md5sum README.md.out
```


# Hashing

* md5sum
* shasum -a 256

