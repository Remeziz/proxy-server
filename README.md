# Proxy Server Installation Guide

## Download and Install Instructions

1. **Download the Script:**
   Clone the repository from GitHub using the following command:
   ```bash
   git clone https://github.com/Remeziz/proxy-server
   ```

2. **Navigate to the Directory:**
   ```bash
   cd proxy-server
   ```

3. **Set Execute Permissions:**
   Change the permissions of the installation script to make it executable:
   ```bash
   chmod 756 install.sh
   ```

4. **Run the Installation Script:**
   Execute the installation script to set up the proxy server:
   ```bash
   ./install.sh
   ```

## Verify the Proxy Server
To check if the proxy server is working correctly, use the following `curl` command:

```bash
curl -x http://<proxy_external_address>:3128 -4 https://hetzner.com
```

### Notes:
- Replace `<proxy_external_address>` with the actual external IP or domain of your proxy server.
- The `-4` flag forces IPv4 usage in the request.

If the command succeeds without errors, your proxy server is operational.

