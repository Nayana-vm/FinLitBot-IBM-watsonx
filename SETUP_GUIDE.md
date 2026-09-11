# FinLitBot - AI Agent for Digital Financial Literacy

## Architecture & Framework
- Development Workflow: IBM Bob Assistant
- Foundation Model: IBM Granite (`ibm/granite-3-8b-instruct`)
- Cloud Infrastructure: IBM watsonx.ai (Dallas us-south region)
- Web Server: Python Flask

## Local Execution Instructions
1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Scan all refs for a specific repository path
Run the script below from the repository root to fetch all refs/tags, unshallow if needed, and check each branch/tag tip for the target PPT path:

```bash
./scripts_scan_refs_for_path.sh
```