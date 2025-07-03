Rex Vulnerability Scanner

Rex is a comprehensive vulnerability scanner that combines both network and web application scanning capabilities. It is designed to help security professionals quickly identify vulnerabilities in network services and web applications.
Features
Network Vulnerability Scanner

    Quick Port Scan: Fast scan of common ports to identify open services.
    Full Port Scan: Thorough scan of all 65535 ports.
    Vulnerability Scan: Detect known vulnerabilities on open ports.
    UDP Services Scan: Scan UDP ports to identify active services.

Web Application Scanner

    Nikto Vulnerability Scan: Perform Nikto-based vulnerability assessment.
    Directory Bruteforce: Discover hidden directories and files.
    SQL Injection Test: Test for SQL injection vulnerabilities.
    Full Web Assessment: Comprehensive web application security assessment.

Installation

    Clone the repository:

    bash

    git clone https://github.com/yourusername/rex-vulnerability-scanner.git
    cd rex-vulnerability-scanner

    Ensure you have the necessary permissions and dependencies installed.

Usage

To run the scanner, you need to have administrator privileges.

    Switch to root user:

    bash

sudo su

Run the scanner script:

bash

    ./rex.sh

Follow the on-screen prompts to select the type of scan you want to perform.
Requirements

    Linux-based operating system
    Root or sudo privileges
    Dependencies (list any tools or libraries your scanner depends on, e.g., nmap, nikto, etc.)

Contributing

Contributions are welcome! Please fork the repository and submit a pull request.
License

Specify your license here (e.g., MIT License).
