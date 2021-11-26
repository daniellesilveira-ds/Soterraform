# Desafio Treinamento Devops
</h3>
<p align="center">
 <a href="#objetivodoprojeto">Objetivo do projeto</a> |
 <a href="#desenvolvedores">Desenvolvedores</a> |
 <a href="#tecnologias">Tecnologias</a> |
 <a href="#descriçãodoprojeto">Descrição do projeto</a> |
 <a href="#prerequisitos">Pré requisitos</a> |
 <a href="#utilização">Utilização</a> |
 <a href="#agradecimento">Agradecimento</a>
</p>

**Status do Projeto: Concluido :heavy_check_mark:**

## Objetivo do projeto

Exercitar os conhecimentos adquiridos do treinamento da Gama Academy:

-  Criar uma **rede isolada** para a aplicação;
-  Criar uma **Pipeline** de infraestrutura para provisionar uma imagem que será utilizada em um cluster kubernetes (single master);
-  Criar uma **Pipeline** para provisionar um cluster Kubernetes multi master utilizando a imagem criada na pipeline de infraestrutura;
- Criar uma pipeline para provisionar o banco de dados (dev, stage, prod) que será utilizado nas aplicações que estarão no kubernetes. Esta base de dados, será provisionada em uma instância privada, com acesso a Internet via Nat Gateway na mesma vpc do kubernetes multi master;
-  Criar uma **Pipeline** de desenvolvimento para deployar os ambientes de uma aplicação Java (dev, stage, prod) com ligação a um banco de dados mysql-server (utilizar o cluster kubernetes(multi master) provisionado pela pipeline de infraestrutura.
  
Para ver o **Repositório do projeto**, clique aqui: [repo-desafio-final-devops](https://github.com/weslleyfs/Wes-Desafio-Final-Devops)</br>

### Desenvolvedores

|[<img src="https://avatars.githubusercontent.com/u/94991826?v=4" width=115 > <br> <sub> Ricardo Bastos Natalino </sub>](https://github.com/earicardo90)|[<img src="https://avatars.githubusercontent.com/u/93945778?v=4" width=115 > <br> <sub> Ronaldo Yudi Endo </sub>](https://github.com/ryudik) | [<img src="https://avatars.githubusercontent.com/u/68025015?v=4" width=115 > <br> <sub> Tiago R. Sartorato </sub>](https://github.com/tgosartorato) | [<img src="https://avatars.githubusercontent.com/u/93946602?v=4" width=115 > <br> <sub> Vinicius Faraco Gimenes </sub>](https://github.com/vinigim) | [<img src="https://avatars.githubusercontent.com/u/39917584?v=4" width=115 > <br> <sub> Weslley Ferreira </sub>](https://github.com/weslleyf) |
| -------- | -------- | -------- |-------- | -------- |

## Tecnologias

Plataformas e Tecnologias que utilizamos para desenvolver este projeto:

- [AWS](https://aws.amazon.com/)
- [Linux (Ubuntu)](https://ubuntu.com/)
- [Shell Script](https://www.gnu.org/software/bash/)
- [Terraform](https://www.terraform.io/)
- [Ansible](https://www.ansible.com/)
- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)
- [Jenkins](https://www.jenkins.io/)
- [Mysql](https://www.mysql.com//)
- [Java](https://www.java.com/)
- [Git](https://www.github.com/)

## Descrição do Projeto

  Construção de pipelines de desenvolvimento, stage e produção, com tecnologias estudadas no treinamento, para provisionar um cluster K8s multi master onde é feito o deployment de uma aplicação Java Spring Boot que acessa o banco de dados mysql em uma rede privada.
  
### Pré-requisitos

- Ter acesso ao Jenkins onde serão executadas as Pipelines **[Jenkins](http://18.230.108.101:8080/)**;
- Ter acesso a console **[AWS](https://console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin)**;
- Ter uma VPC com Internet Gataway criados e uma Key pair.
> Obs: será necessário fornecer os IDs da VPC, Internet Gataway e Key Pair para as variaveis do terraform

### Utilização:

**1.** Faça o clone do repositorio para sua maquina;

~~~~
git clone https://github.com/weslleyfs/Wes-Desafio-Final-DEVOPS.git
~~~~

**2.** Altere os arquivos de variaveis dentro de cada pasta terraform colocando os IDs da VPC, Internet Gataway e Key Pair;

**3.** Acesse o **[Jenkins](http://18.230.108.101:8080/)** para iniciar a contrução das Pipelines;

> **IMPORTANTE: A sequencia de criação e execução das Pipelines devem ser respeitadas pois o output de cada Pipeline serão necessários para a contrução da proxima Pipeline:**
>> **1º Build_AMI_AWS**
>>> **2º Build-k8s-mult-master**
>>>> **3º Create-EC2_mysql**
>>>>> **4º Delivery_and_Deployment_Java_app**


* Logado no **[Jenkins](http://18.230.108.101:8080/)** selecione **New Item** **>** Digite um nome para sua Pipeline **>** Selecione a opção **Pipeline** **>** **OK**
* Dentro de cada pasta do projeto existe um arquivo chamado "jenkinsfile" que deve ser utilizado para construção das respectivas Pipelines, copie seu conteudo para o campo **Script** **>** **SAVE**
* Selecione a opção **Build Now** e após finalizar, atualize sua pagina e selecione a opção **Build with Parameters**
* Digite os parametros necessários conforme descrição de cada etapa **>** **Build**.

### Agradecimentos
- [Danilo Aparecido](https://github.com/didox) por todo o apoio;
- DOTI e todos os nossos colegas que seguraram as pontas durante este curso;
- Pessoal da Gama Academy pelo apoio e organização do curso.