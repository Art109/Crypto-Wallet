# Projeto Desenvolvido no Curso de Rails 5.x

O sistema funciona como uma simples carteira virtual onde pode registrar cripto moedas

No projeto foi utilizado

-Vagrant 2.4 Para o controle do container via terminal
-VirtualBox 7 Para a virtualização de ambiente Ubuntu
-Bootstrap 5 para o visual
-Ruby 3.3.5
-Rails 7.2.1

# Como testar o projeto

Para usar essa box você precisa instalar o:

- VirtualBox (https://www.virtualbox.org/)
- Vagrant (https://www.vagrantup.com/)
- Git for Windows (somente para usuários Windows - https://gitforwindows.org/)

## Após a instalação dos itens acima, siga os passos abaixo, usando um terminal.

1- Instale o plugin do vagrant
```
vagrant plugin install vagrant-vbguest
```

2- Clone esse repositório e entre na pasta

3- Inicie a box
```
vagrant up
```

4- Acesse o Cloud9 em **http://localhost:8181**  ou use o **vagrant ssh** para acessar a box via ssh.

Entre na pasta(via terminal) workspace/projeto/crypto_wallet

E digite o comando rails s ou rails s -b 0.0.0.0

5- Acesse o Projeto em http://localhost:3000

## Dicas de comandos para gerir sua box

- Para pausar a box
```
vagrant suspend
```

- Para iniciar/levantar a box
```
vagrant up
```

- Para parar a box
```
vagrant halt
```
