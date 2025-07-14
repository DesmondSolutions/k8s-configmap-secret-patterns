# Kubernetes ConfigMap & Secret Consumption Patterns

This repository showcases the **three primary methods** of injecting `ConfigMaps` and `Secrets` into Kubernetes Pods — through **environment variables**, **command-line arguments**, and **mounted volumes**. It includes practical YAML examples and discusses the **trade-offs, security implications, and use-case suitability** of each approach.

Understanding how to securely and effectively provide configuration and sensitive data to containers is fundamental in Kubernetes. While Kubernetes makes this easy through native abstractions like ConfigMaps and Secrets, how you expose them to your application significantly impacts:

- **Security posture**
- **Operational stability**
- **Developer experience**
- **Runtime flexibility**

---

## 📌 Why This Matters

Many teams expose credentials or app settings incorrectly — often by using environment variables for secrets — which can lead to **leaks via logs, core dumps, or process inspection**. This project is designed to help engineers adopt **safe, scalable, and maintainable** patterns.

Whether you're running a simple internal app or deploying services on a public cloud, selecting the right configuration injection method is key to:

- Preventing secret exposure
- Meeting compliance standards (e.g., PCI, SOC 2)
- Supporting portability and automation

---

## 🔍 What’s Included

- ✅ Kubernetes `ConfigMap` and `Secret` definitions
- ✅ Pod examples for all 3 consumption methods:
  - Environment variables (`env` and `envFrom`)
  - Command-line argument injection
  - Volume-mounted files
- ✅ Full walkthroughs and logs
- ✅ Comparisons of each approach
- ✅ Security-focused analysis
- ✅ Real-world usage recommendations

---

## 🛡️ Security & Best Practice Summary

| Injection Method     | Pros                                | Cons / Risks                              | Best Use Case                             |
|----------------------|--------------------------------------|-------------------------------------------|-------------------------------------------|
| **Environment Vars** | Simple, native to all languages      | ❌ Secrets visible via `/proc` and logs    | Basic config, non-sensitive values        |
| **CLI Args**         | Useful for entrypoints/scripts       | ❌ Visible via `ps`, hard to secure        | Startup options, toggles, debug flags     |
| **Mounted Files**    | Fine-grained control, safer for secrets | ✅ Secure, can set file permissions     | 🔐 Secrets, keys, credentials, certs      |

📢 **Use mounted volumes for Secrets whenever possible.** This avoids putting sensitive data in memory that can be accessed unintentionally.

---

## 🎯 Choosing the Right Pattern

Use this table to guide your decision:

| Scenario                             | Recommended Pattern    | Reason                                      |
|--------------------------------------|------------------------|---------------------------------------------|
| App reads from env vars              | Env (`envFrom`)        | Simple, native                              |
| Startup script uses dynamic args     | CLI injection          | Convenient, but secure only for non-secrets |
| Secret token or cert is needed       | Volume mount (Secret)  | ✅ Most secure way to handle secrets         |
| App reads config files at runtime    | Volume mount (ConfigMap) | Avoids rebuilds for config changes       |

---

## ✅ Who Should Use This

- DevOps engineers looking to enforce secure config practices
- Developers learning Kubernetes pod patterns
- Teams preparing for security audits
- Anyone building infrastructure-as-code portfolios

---

## 👨‍💻 Author

Maintained by **Desmond Nduma**, as part of a broader effort to showcase Kubernetes best practices, security-first DevOps, and hands-on learning.

