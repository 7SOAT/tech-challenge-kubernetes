<h1 align="center"> API Gateway, EKS, ECS ☁️</h1>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<p align="justify">
  Para rodar o projeto localmente, primeiro você precisa se certificas que possui essas ferramentas insaladas:
</p>

* [NodeJS e NPM](https://nodejs.org/en)
* [Terraform](https://www.terraform.io/)
* [Kubernetes](https://kubernetes.io/pt-br/)

```
src
├── k8s
├── api-gateway.tf
├── data.tf
├── eks-cluster.tf
├── elastic-ip.tf
├── gateways.tf
├── load-balancers.tf
├── main.tf
├── output.tf
├── providers.tf
├── route-table-associations.tf
├── route-tables.tf
├── security-groups.tf
├── subnets.tf
├── target-groups.tf
├── variables.tf
├── vpc.tf
└── main.ts
```

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<p align="justify">
  Exemplo de variáveis de ambiente:
</p>

```
aws_iam_labrole_arn = ""
aws_rds_dbname = ""
aws_rds_username = ""
aws_rds_password = ""
tech_challenge_api_port = 4000
```
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<h3>Instalar bibliotecas</h3>
<p>Para instalar as bibliotecas, abra o terminal na raiz do projeto e execute o seguinte comando:</p>

``` npm install ```

<h3>Executar o projeto</h3>
<p>Para executar o projeto de autenticação utilizando Lambda na AWS, abra o terminal na raiz do projeto e execute os seguintes comandos:</p>

```
npm install -g dotenv-cli
```
```
dotenv -e .env -- terraform apply
```
<p>A partir disto o Actions irá prosseguir com a execução.</p>
