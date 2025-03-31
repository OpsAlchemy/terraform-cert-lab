### **Enabling Debugging in Terraform**

Terraform provides several environment variables for debugging and enhanced logging. The most commonly used debugging variables are:

#### **1. TF_LOG**
- Controls the verbosity of Terraform logs.
- Available levels:
  - **TRACE**: Very detailed information, including all internal data.
  - **DEBUG**: Detailed information for debugging.
  - **INFO**: General information.
  - **WARN**: Warnings that may need attention.
  - **ERROR**: Errors only.

**Usage:**
```bash
export TF_LOG=DEBUG
```

#### **2. TF_LOG_PATH**
- Specifies the file to which logs will be written.
- By default, logs are printed to stderr.

**Usage:**
```bash
export TF_LOG_PATH="/path/to/terraform.log"
```

#### **3. TF_INPUT**
- Controls whether Terraform prompts for input.
- Default is `true`.
- Set to `false` to disable prompts.

**Usage:**
```bash
export TF_INPUT=false
```

#### **4. TF_VAR_name**
- Used to set variables via environment variables.
- Replace `name` with the actual variable name.

**Usage:**
```bash
export TF_VAR_context="swarm"
```

#### **5. TF_CLI_ARGS**
- Automatically appends arguments to every Terraform command.
- Useful for specifying global flags.

**Usage:**
```bash
export TF_CLI_ARGS="-auto-approve"
```

#### **6. TF_WORKSPACE**
- Sets the workspace to use.
- Equivalent to running `terraform workspace select`.

**Usage:**
```bash
export TF_WORKSPACE="production"
```

#### **7. TF_DATA_DIR**
- Specifies an alternate working directory.
- Default is `.terraform`.

**Usage:**
```bash
export TF_DATA_DIR="/custom/path/to/.terraform"
```

#### **8. TF_LOG_PROVIDER**
- Enables provider-specific debugging.

**Usage:**
```bash
export TF_LOG_PROVIDER=TRACE
```

---

### **Unsetting Environment Variables**
To clear a variable:
```bash
unset TF_LOG
unset TF_LOG_PATH
unset TF_VAR_context
```

---

### **Example: Enabling Debugging and Saving Logs**
```bash
export TF_LOG=DEBUG
export TF_LOG_PATH="terraform_debug.log"
terraform plan
```
Logs will be saved to `terraform_debug.log`.

---

### **Comprehensive Terraform Debugging and Environment Variables Notes**

#### **1. Terraform Debugging**

| Environment Variable | Purpose | Example |
|---------------------|--------|---------|
| TF_LOG               | Controls log verbosity | `export TF_LOG=DEBUG` |
| TF_LOG_PATH          | File to write logs | `export TF_LOG_PATH="/tmp/terraform.log"` |
| TF_LOG_PROVIDER      | Provider-specific logs | `export TF_LOG_PROVIDER=TRACE` |

---

#### **2. Terraform Input Control**

| Environment Variable | Purpose | Example |
|---------------------|--------|---------|
| TF_INPUT             | Enable/disable input | `export TF_INPUT=false` |

---

#### **3. Variable Setting**

| Environment Variable | Purpose | Example |
|---------------------|--------|---------|
| TF_VAR_name          | Set a variable | `export TF_VAR_context="swarm"` |

---

#### **4. Terraform Workspace**

| Environment Variable | Purpose | Example |
|---------------------|--------|---------|
| TF_WORKSPACE         | Sets active workspace | `export TF_WORKSPACE="production"` |

---

#### **5. CLI Arguments**

| Environment Variable | Purpose | Example |
|---------------------|--------|---------|
| TF_CLI_ARGS          | Append arguments | `export TF_CLI_ARGS="-auto-approve"` |

---

#### **6. Data Directory**

| Environment Variable | Purpose | Example |
|---------------------|--------|---------|
| TF_DATA_DIR          | Alternate data directory | `export TF_DATA_DIR="/custom/path"` |

---

### **Debugging Tips:**
1. **Check Logs:**
   - Logs can be very verbose. Use `grep` to filter errors:
     ```bash
     grep ERROR terraform_debug.log
     ```
2. **Disable Logging After Debugging:**
   ```bash
   unset TF_LOG
   unset TF_LOG_PATH
   ```
3. **Clear Previous Logs:**
   ```bash
   rm -f terraform_debug.log
   ```
4. **Combine Multiple Variables:**
   ```bash
   export TF_LOG=TRACE TF_LOG_PATH="trace.log"
   ```

---

### **Troubleshooting:**
- If you encounter unexpected behavior, set `TF_LOG=TRACE` for the most detailed output.
- Combine with `TF_LOG_PATH` to preserve logs for later analysis.
