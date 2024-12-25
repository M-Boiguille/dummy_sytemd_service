# Dummy Systemd Service

Project from: [https://roadmap.sh/projects/dummy-systemd-service](https://roadmap.sh/projects/dummy-systemd-service)

Dummy Systemd Service is a Bash script designed to provide an overview of service creation and management using systemd. It continuously logs messages into a file every 10 seconds, simulating a background service. The project showcases how to handle custom services, ensuring reliability and easy debugging.

## Features
- **Service Automation**: Automatically starts on boot and restarts on failure.
- **Logging**: Logs are written both to the system journal and a dedicated log file.
- **Service Management**: Supports commands to start, stop, enable, and disable the service.

## Usage
### Syntax
```
./install_dummy_service.sh
```
- **`-f`**: Forcefully overwrites existing service configurations.

### Output
1. **Service Installation**:
   - Creates a persistent service.
   - Registers and starts it automatically.

2. **Service Management Commands**:
   ```bash
   sudo systemctl start dummy
   sudo systemctl stop dummy
   sudo systemctl enable dummy
   sudo systemctl disable dummy
   sudo systemctl status dummy
   ```

3. **Log Access**:
   ```bash
   # Real-time logs
   sudo journalctl -u dummy -f
   ```

### Examples
Install the service directly:
```bash
sudo ./install_dummy_service.sh
```
Reinstall the service forcefully:
```bash
sudo ./install_dummy_service.sh -f
```

Uninstall the service:
```bash
sudo ./uninstall_dummy_service.sh
```

## Development Environment
- **OS:** Linux (Ubuntu)
- **Language:** Bash
- **Tools Used:**
  - `awk` for text processing.
  - `grep` for pattern matching.
  - `journalctl` for service logs.
  - `systemctl` for managing the service.

## Improvements
- Allow dynamic log file paths.
- Add support for environment variables to configure service behavior.
- Extend monitoring capabilities with alerting mechanisms for failures.

## Conclusion
Dummy Systemd Service is a lightweight and practical tool for understanding `systemd`. It offers a streamlined way to explore creating custom services, managing their lifecycle, and debugging with real-time logs.

The [project link](https://roadmap.sh/projects/dummy-systemd-service).

Thanks to [https://roadmap.sh](https://roadmap.sh/).
