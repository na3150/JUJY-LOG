# 🦄 JUJY-LOG
JUJY-LOG is created by customizing [morethan-log](https://github.com/morethanmin/morethan-log) open source. This web contains brief introductions to team members and various documents.
<br>

## 🕹️ Features
**☁️ AWS**
- Building a CI/CD pipeline using AWS CodeSeries (CodeCommit, CodeBuild, CodePipeline)
- Configure EKS clusters with Fargate
- Deploying eks cluster using eksctl
- Use assume role to temporarily grant permission only when needed

**👾 Terraform**
-  Automate infrastructure deployment with Terraform
-  Improved reusability through modularization
  
```shell
terraform
├── README.md
├── module
│   ├── codebuild
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── role.tf
│   │   └── variables.tf
│   ├── codepipeline
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── role.tf
│   │   └── variables.tf
│   ├── ecr
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── eks
│       ├── main.tf
│       ├── outputs.tf
│       ├── role.tf
│       └── variables.tf
└── root
    └── dev
        ├── main.tf
        └── variables.tf
```
 
 <br>

## 🌐 Architecture
<img src="https://github.com/na3150/JUJY-LOG/assets/64996121/53ecdd60-7580-4442-80fa-3f7c2396e97e" width=700/>

| AWS Resource | Content | Terraform Automation |
| --- | --- | --- |
| Codecommit | Includes jujylog code file, kubernetes manifest file and buildspec.yaml. | x |
| CodeBuild | Build docker image and push to ecr, eks apply (according to buildspec.yaml). | o |
| CodePipeline | Run pipeline when push is detected in codecommit. | o |
| ECR | Save the image created from codebuild. | o |
| EKS | Create an eks yaml file and deploy it with eksctl. Deploy jujylog image with eks fargate. Automate eksctl command execution with local-exec, without modularization. | x |
<br>

## 👀 Results
Check the endpoint of loadbalancer.
```shell
kubectl get svc

NAME          TYPE           CLUSTER-IP      EXTERNAL-IP                                                                    PORT(S)        AGE
jujy-svc-lb   LoadBalancer   10.100.45.255   k8s-default-jujysvcl-92594f457a-7581a6210e49c6a5.elb.us-east-1.amazonaws.com   80:31814/TCP   14m
```
Connect to endpoint.
![image](https://github.com/na3150/JUJY-LOG/assets/64996121/5ed4644b-7784-4ddd-8034-c6eb40344748)
