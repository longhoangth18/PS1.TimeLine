# PowerShell Timeline Tool (ps1timeline.ps1)

<p align="center">
  <img alt="PowerShell Icon" src="https://github.com/github/explore/raw/main/topics/powershell/powershell.png" width="100">
</p>

## Overview

`ps1timeline.ps1` is a PowerShell script designed to analyze and retrieve information about files created or modified within a specified timeframe in a given directory. This tool is useful for digital forensics and file tracking scenarios.

## Features

- **File Tracking:** Identify files created or modified within a specified number of days.
- **Hash Calculation:** Calculate SHA256 hash values for files (if available).
- **Owner Information:** Retrieve information about the file owner.
- **CSV Export:** Export results to CSV files (`NewCreate_FilesInfo.csv` and `Modified_FilesInfo.csv`) for further analysis.

## Usage

1. **Download:** Clone or download the repository to your local machine.

    ```bash
    git clone https://github.com/longhoangth18/PS1.TimeLine.git
    ```

2. **Run Script:**

    ```powershell
    cd PS1.TimeLine
    .\PS1TimeLine.ps1
    ```

3. **Follow the prompts:** Enter the number of days to retrieve files from.

4. **Review Output:** CSV files will be generated with detailed information.

## Screenshots

![image](https://github.com/longhoangth18/PS1.TimeLine/assets/152260528/9b9643f4-c7fd-47d6-9474-098377e75608)


## Requirements

- Windows PowerShell

## Contributing

If you would like to contribute to the project, please follow the [contribution guidelines](CONTRIBUTING.md).

## Contact

For issues or suggestions, please open an [issue](https://github.com/longhoangth18/ps1timeline/issues).

## More

For more projects, visit [my GitHub profile](https://github.com/longhoangth18).
