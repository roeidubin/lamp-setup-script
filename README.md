# 🚀 LAMP Setup Script

A smart Bash script that installs and configures a complete **LAMP development environment** (Linux, Apache, MySQL, PHP).  
Ideal for developers or DevOps engineers who want to automate local web server setup.

---

## 🧠 What This Script Does

✅ Validates OS and user permissions  
✅ Installs:
- Apache (web server)
- MySQL (database)
- PHP (server-side scripting)

✅ Skips already-installed packages  
✅ Starts Apache and enables it on boot  
✅ Verifies that Apache is running using `curl`  
✅ Logs all output to `setup-log.txt`

---

## 🛠️ Requirements

- Ubuntu or Debian-based Linux
- Internet connection
- `curl` (installed automatically if missing)
- Sudo privileges

---

## 📦 How to Use

1. Clone this repository or copy the script  
2. Make the script executable:

```bash
chmod +x setup-dev-env.sh
