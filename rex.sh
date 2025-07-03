#!/bin/bash

# Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# ASCII Art
function rex_banner {
  clear
  echo -e "${PURPLE}"
  echo ' ██████╗ ███████╗██╗  ██╗███████╗ █████╗ ███╗   ██╗'
  echo ' ██╔══██╗██╔════╝╚██╗██╔╝██╔════╝██╔══██╗████╗  ██║'
  echo ' ██████╔╝█████╗   ╚███╔╝ ███████╗███████║██╔██╗ ██║'
  echo ' ██╔══██╗██╔══╝   ██╔██╗ ╚════██║██╔══██║██║╚██╗██║'
  echo ' ██║  ██║███████╗██╔╝ ██╗███████║██║  ██║██║ ╚████║'
  echo -e "${WHITE}╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝${NC}"
  echo -e "${BLUE}=====================================================${NC}"
  echo -e "${CYAN}         R E X S A N T I O   S E C U R I T Y${NC}"
  echo -e "${BLUE}=====================================================${NC}"
  echo -e "${YELLOW}            Advanced Vulnerability Scanner${NC}"
  echo -e "${BLUE}=====================================================${NC}"
  echo ""
}

# Dependency Check
function check_deps {
  missing=0
  deps=("nmap" "nikto" "dirb" "sqlmap" "whois")
  
  for dep in "${deps[@]}"; do
    if ! command -v $dep &> /dev/null; then
      echo -e "${RED}[!] Missing: $dep${NC}"
      missing=1
    fi
  done
  
  if [ $missing -eq 1 ]; then
    echo -e "${YELLOW}\n[!] Install missing dependencies first!${NC}"
    exit 1
  fi
}

# Main Menu
function main_menu {
  rex_banner
  echo -e "${WHITE}1. Network Vulnerability Scanner${NC}"
  echo -e "${WHITE}2. Web Application Scanner${NC}"
  echo -e "${WHITE}4. Exit${NC}"
  echo -e "${BLUE}=====================================${NC}"
  
  read -p "Select an option [1-4]: " choice
  
  case $choice in
    1) network_menu ;;
    2) web_menu ;;
    3) auto_pen_test ;;
    4) exit 0 ;;
    *) echo -e "${RED}[!] Invalid option!${NC}"; sleep 1; main_menu ;;
  esac
}

# Network Scanner Menu
function network_menu {
  rex_banner
  echo -e "${CYAN}NETWORK VULNERABILITY SCANNER${NC}"
  echo -e "${BLUE}==============================${NC}"
  echo -e "${WHITE}1. Quick Port Scan${NC}"
  echo -e "${WHITE}2. Full Port Scan${NC}"
  echo -e "${WHITE}3. Vulnerability Scan${NC}"
  echo -e "${WHITE}4. UDP Services Scan${NC}"
  echo -e "${WHITE}5. Back to Main Menu${NC}"
  
  read -p "Select scan type [1-5]: " scan_type
  
  read -p "Enter target IP/hostname: " target
  echo -e "${GREEN}\n[+] Starting scan on $target...${NC}"
  
  case $scan_type in
    1) nmap -T4 -F $target ;;
    2) nmap -T4 -p- $target ;;
    3) nmap -T4 -A -sV --script vuln $target ;;
    4) nmap -sU -T4 $target ;;
    5) main_menu ;;
    *) echo -e "${RED}[!] Invalid option!${NC}"; sleep 1; network_menu ;;
  esac
  
  echo -e "${GREEN}\n[+] Scan completed!${NC}"
  echo -e "${PURPLE}───────────────"
  echo -e " ReXScan v1.0"
  echo -e " by RE X S A N T I O"
  echo -e "───────────────${NC}"
  read -p "Press Enter to continue..."
  network_menu
}

# Web Scanner Menu
function web_menu {
  rex_banner
  echo -e "${CYAN}WEB APPLICATION SCANNER${NC}"
  echo -e "${BLUE}========================${NC}"
  echo -e "${WHITE}1. Nikto Vulnerability Scan${NC}"
  echo -e "${WHITE}2. Directory Bruteforce${NC}"
  echo -e "${WHITE}3. SQL Injection Test${NC}"
  echo -e "${WHITE}4. Full Web Assessment${NC}"
  echo -e "${WHITE}5. Back to Main Menu${NC}"
  
  read -p "Select scan type [1-5]: " web_type
  read -p "Enter target URL (e.g., http://site.com): " target
  
  echo -e "${GREEN}\n[+] Starting web scan on $target...${NC}"
  
  case $web_type in
    1) nikto -h $target ;;
    2) dirb $target /usr/share/wordlists/dirb/common.txt -w ;;
    3) sqlmap -u $target --batch --crawl=2 ;;
    4) 
      nikto -h $target
      dirb $target /usr/share/wordlists/dirb/common.txt -w
      sqlmap -u $target --batch --crawl=2
      ;;
    5) main_menu ;;
    *) echo -e "${RED}[!] Invalid option!${NC}"; sleep 1; web_menu ;;
  esac
  
  web_menu
}

# Main Execution
check_deps
main_menu
