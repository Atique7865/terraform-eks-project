
# Terraform EKS Cluster - Modular Project

This is a production-ready, modular Terraform project that provisions a complete EKS (Elastic Kubernetes Service) cluster on AWS with best practices.

---

## 📁 Project Structure

```
terraform-eks-project/
├── backend/                 # S3 bucket & DynamoDB table for remote state & locking
│   └── main.tf
├── modules/
│   ├── vpc/                 # VPC, subnets, IGW, and route tables
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── eks/                 # EKS cluster using terraform-aws-modules
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── main.tf                  # Root file to invoke all modules
├── providers.tf             # AWS provider configuration
├── outputs.tf               # Root output values
└── README.md                # Project documentation
```

---

## 🚀 Features

- ✅ Modular structure using `modules/` folder
- ✅ VPC with public/private subnets, IGW, route table
- ✅ EKS cluster with custom version support
- ✅ Remote state backend using S3 and DynamoDB
- ✅ Best practice layout for team collaboration

---

## 🔧 Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed (v1.0+)
- IAM user/role with necessary permissions for EKS/VPC/S3/DynamoDB
- Create the S3 bucket and DynamoDB table manually **OR** apply `backend/main.tf` first

---

## ☁️ How to Use

### 1. Clone and navigate to project

```bash
git clone <your-repo-url>
cd terraform-eks-project
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Preview infrastructure changes

```bash
terraform plan
```

### 4. Apply the infrastructure

```bash
terraform apply
```

---

## 📤 Output

After apply, you'll get:

- ✅ VPC ID
- ✅ Subnet IDs
- ✅ EKS Cluster ID

---

## 📚 Resources Used

- [terraform-aws-modules/eks](https://github.com/terraform-aws-modules/terraform-aws-eks)
- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

## 🙋‍♂️ Need Help?

Feel free to open an issue or contact the maintainer.

