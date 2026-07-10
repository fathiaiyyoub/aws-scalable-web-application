# Scalable Web Application on AWS with Advanced Request Routing

A production-style AWS Solutions Architecture portfolio project demonstrating the design, deployment, and documentation of a scalable web application on Amazon Web Services (AWS).

The solution demonstrates a highly available architecture using an Application Load Balancer (ALB), Amazon EC2, Amazon Route 53, and advanced request routing through both host-based and path-based routing rules.

Following the deployment, the infrastructure was reverse-engineered into **Terraform** to provide Infrastructure as Code (IaC), making the solution easier to understand, version control, and reproduce.

> **Status:** ✅ Completed

---

# Business Scenario

An organization hosts multiple web applications under a single domain and requires an efficient way to route users to different application environments without deploying separate load balancers for each service.

The solution must:

- Provide high availability across multiple Availability Zones.
- Support both URL path-based and subdomain-based request routing.
- Simplify DNS management using a single custom domain.
- Be scalable to support future application growth.
- Follow Infrastructure as Code (IaC) principles for maintainability and repeatability.

---

# Project Objectives

The objectives of this project were to:

- Design and deploy a scalable web application on AWS.
- Implement high availability by distributing resources across multiple Availability Zones.
- Configure an Application Load Balancer (ALB) to perform both path-based and host-based request routing.
- Integrate Amazon Route 53 with a custom domain for DNS resolution.
- Secure application access using Security Groups and IAM roles following the principle of least privilege.
- Store and serve website assets from Amazon S3.
- Reverse-engineer the deployed infrastructure into Terraform to demonstrate Infrastructure as Code (IaC) best practices.
- Produce professional documentation and project artifacts suitable for an AWS Solutions Architect portfolio.

---

# Solution Architecture

The solution follows a highly available, multi-tier AWS architecture designed to distribute incoming web traffic across multiple Amazon EC2 instances deployed in separate Availability Zones.

Users access the application through a custom domain managed by Amazon Route 53. DNS requests are forwarded to an internet-facing Application Load Balancer (ALB), which evaluates listener rules and routes traffic based on either the requested URL path or the requested host header (subdomain).

The backend application consists of two Amazon EC2 instances (Red and Blue), each serving different web content. Website assets are stored in Amazon S3 and retrieved securely by the EC2 instances using an IAM role following the principle of least privilege.

---

# AWS Services Used

| AWS Service | Purpose |
|-------------|---------|
| Amazon EC2 | Hosts the Red and Blue web applications. |
| Application Load Balancer (ALB) | Distributes incoming traffic and performs path-based and host-based request routing. |
| Amazon Route 53 | Provides DNS hosting and routes the custom domain to the Application Load Balancer. |
| Amazon S3 | Stores static website assets accessed by the EC2 instances. |
| AWS Identity and Access Management (IAM) | Provides secure access for EC2 instances to retrieve files from Amazon S3 using an IAM role. |
| Amazon VPC | Provides network isolation for the application infrastructure. |
| Security Groups | Control inbound and outbound network traffic. |
| Terraform | Represents the deployed infrastructure as Infrastructure as Code (IaC). |

---

# Architecture Diagram

The following diagram provides a high-level view of the AWS solution implemented for this project.

It illustrates how Amazon Route 53, the Application Load Balancer, Amazon EC2 instances, IAM roles, and Amazon S3 work together to deliver a scalable and highly available web application.

![AWS Architecture](architecture.png)

---

# Key Features

- Highly available architecture across multiple Availability Zones.
- Path-based and host-based request routing using an Application Load Balancer.
- Custom domain integration with Amazon Route 53.
- Secure access to Amazon S3 using IAM roles.
- Infrastructure documented as Terraform Infrastructure as Code (IaC).
- Terraform configuration validated using `terraform validate`.

---

# Testing & Validation

The deployed solution was successfully tested to verify both functionality and architecture.

## Functional Testing

- Verified connectivity to both Amazon EC2 instances.
- Confirmed successful retrieval of website assets from Amazon S3 using the configured IAM role.
- Verified Application Load Balancer health checks for both target groups.
- Tested path-based routing using:
  - `/red`
  - `/blue`
- Tested host-based routing using:
  - `red.fathiaiyyoub.com.au`
  - `blue.fathiaiyyoub.com.au`
- Verified DNS resolution through Amazon Route 53.
- Confirmed application accessibility through the custom domain.

## Infrastructure Validation

The deployed infrastructure was reverse-engineered into Terraform and validated using:

```bash
terraform validate
```

The Terraform configuration was then formatted using:

```bash
terraform fmt
```

Screenshots demonstrating the deployment, routing configuration, DNS records, Terraform project structure, and validation are included throughout this repository.

---

# Lessons Learned

This project reinforced the importance of designing cloud solutions that are not only functional but also scalable, maintainable, and well documented.

Beyond deploying AWS resources, it demonstrated the value of Infrastructure as Code, architectural documentation, validation, and version control as part of delivering production-style cloud solutions.

Key takeaways included:

- Designing highly available architectures across multiple Availability Zones.
- Configuring both path-based and host-based routing using an Application Load Balancer.
- Integrating Amazon Route 53 with a custom domain.
- Applying the principle of least privilege through IAM roles.
- Organizing Infrastructure as Code using Terraform into logical, maintainable components.
- Appreciating the importance of documentation and validation as part of a complete cloud solution.
