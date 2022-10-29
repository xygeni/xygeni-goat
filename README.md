# xygeni-goat - Vulnerable repository against supply chain attacks

[![Maintained by xygeni.io](https://img.shields.io/badge/maintained%20by-xygeni.io-blueviolet)](https://xygeni.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=xygeni-goat)

A deliberately vulnerable repository against software supply chain attacks, by Xygeni.

![xygeni-goat](xygeni-goat-logo.png)

* [Introduction](#introduction)
* [Getting Started](#getting-started)
* [Contributing](#contributing)
* [Support](#support)

## Introduction

Xygeni-goat helps to understand DevOps teams the best practices to follow and which issues should be avoided, for having a good security posture, lowering the risk against software supply chain attacks. Looking at the elements reported as security flaws, you may learn about misconfigurations to avoid. IaC templates that contains insecure configurations, hardcoded secrets, unsafe tool configurations, troublesome dependencies and more are covered.

This repository is based on existing "Goat" projects, like OWASP [WebGoat](https://github.com/WebGoat/WebGoat). 

Shear the (nefarious) goat!

**WARNING**: This repository is for educational purposes only. Do NOT attempt to use the techniques and items shown for unauthorized hacking. Do NOT deploy assets from this repository this in any environment.

**DISCLAIMER**: Xygeni-goat comes with no warranties. By using xygeni-goat, you take full responsibility for any outcomes. Xygeni would not be liable of any misuse of the information and assets contained in this repository.  

## Getting Started

1. Clone the repo, or download 
```
git clone https://github.com/xygeni/xygeni-goat.git
```
or 
or 
```
gh repo clone xygeni/xygeni-goat
```

2. Install Xygeni scanner

First you will need a bearer (API) token from your Xygeni subscription. [TBD add link]
We assume that you set a `TOKEN` environment variable with the token. 

If you choose to use the Xygeni scanner Docker image, go to next step.

Download the install script and run it:

Under Linux / macOS (bash):
```shell
# Download the install script
curl -L https://get.xygeni.io/latest/scanner/bash -O install.sh

# Check the scanner checksum published in xygeni.io website (separate environment), 
# or better review the install script yourself ;)
echo "$(curl https://xygeni.io/checksums/latest/scanner/bash.sha256) install.sh" | sha256sum --check

# Run the install script, creating the scanner in your chosen directory
$ ./install.sh -o -t $TOKEN --dir $HOME/my-custom-scanner-dir
```

Under Windows (PowerShell):
```powershell
# Download the install script (via Invoke-WebRequest)
iwr https://get.xygeni.io/latest/scanner/powershell -useb -OutFile install.ps1

# Check the scanner checksum published in xygeni.io website, 
# or better review the install script yourself ;)
(Get-FileHash '.\install.ps1' -Algorithm SHA256).Hash -eq `
  (iwr https://xygeni.io/checksums/latest/scanner/powershell.sha256)
  
# Run the install script, creating the scanner in your chosen directory
PS .\install.ps1 -q -t $TOKEN --dir ~\my-custom-scanner-dir
```

See [Xygeni Scanner Install](https://docs.xygeni.io/scanner/install_script.html) for full details.

3. Run the scanner over the contents in the `vulnerable` directory, or any subdirectory beneath for a partial analysis. 

```shell
cd $HOME/my-custom-scanner-dir
deps-doctor scan -n <your_project_name> --dir <path_to_analyze> --no-upload
```

Under Windows (Powershell)
```powershell
cd ~\my-custom-scanner-dir
deps-doctor.cmd scan -n <your_project_name> --dir <path_to_analyze> --no-upload
```

Or, if you prefer to run the [Xygeni scanner Docker image](https://docs.xygeni.io/integrations/docker/docker.html):
```shell
docker compose run depsdoctor scan -n project_to_scan_name --dir /app --no-upload
```

## Contributing

You may add your own vulnerable items to help others learn about additional security issues, and raise awareness on new potential attacks.
We recommend you to keep the existing directory structure for better categorizing those security issues.  

In addition, if you want to add a new "capture the flag" (CTF) check, you are welcome!

### Development

1. Clone the repository:
```
git clone https://github.com/xygeni/xygeni-goat.git
```
or 
```
gh repo clone xygeni/xygeni-goat
```

Alternatively, you may [fork the repo](https://docs.github.com/en/get-started/quickstart/fork-a-repo).


2. Create your topic branch


3. Develop your changes

We recommend to follow the existing directory structure for categorizing the security issue.  


4. Test your changes

If you developed a new check, test with [TBD].
If you created a new vulnerable element, test it with Xygeni scanner, as shown in the [Getting Started](#getting-started) section.


5. Push commits to your topic branch.


6. Create a pull request, using `gh pr create` command or the GitHub desktop / web UI.

After review, your PR will be merged.


### Add a new Capture The Flag challenge

[TBD]

Each CTF challenge has a separate directory in the `ctf` directory.
Follow the steps below to add a CTF challenge: 

1. Write challenge description.
2. Choose category and difficulty level.
3. Write hints for help.
4. Add a flag. Ensure that it is not accesible when solving other CTF challenges.
5. Write tests.
6. Write the solution.
7. Create a README.md in your CTF directory.

## Support
