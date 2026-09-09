FINLITBOT LOCAL RUNTIME ENVIRONMENT & NETWORK ADDRESSESProtocol:             HTTP / 1.1Default Host:         127.0.0.1  (Localhost loopback)Network Host:         0.0.0.0    (All active interfaces)Assigned Port:        5000       (Standard Flask Development Port)Primary Application URL: http://localhost:5000/  http://127.0.0.1:5000/Alternate / Production Fallback Port:
 http://127.0.0.1:8080/ (Configurable via PORT=8080 in .env)
### Active REST Endpoints Reference Table

| HTTP Method | Route Endpoint | Purpose / Functionality | Source / Target Service |
| :--- | :--- | :--- | :--- |
| **`GET`** | `/` | Web UI Client Interface | Server-rendered `index.html` |
| **`POST`** | `/api/chat` | Main Conversation Agent | IBM watsonx.ai REST Generation API |
| **`POST`** | `/api/triage` | Emergency Fraud Interception | Golden Hour 1930 Protocol Rules Engine |
| **`POST`** | `/api/calculate-emi` | Interactive Loan EMI Tool | Client / Server Financial Module |
| **`GET`** | `/api/health` | Service & IBM Connection Check | Ping diagnostic (`200 OK`) |

---

## System Architecture
<img width="8192" height="2744" alt="FinTech EMI Calculation-2026-09-09-204318" src="https://github.com/user-attachments/assets/47921fc9-5b22-4413-beb4-a70ae7afcda1" />


##  Key Features

* **Instant Golden Hour Triage Engine:** Guides victims step-by-step through bank account freezing, UPI ID disabling, and lodging a complaint with the National Cyber Crime Helpline (**1930** or [cybercrime.gov.in](https://cybercrime.gov.in)) within the first 2 hours to facilitate transaction freeze under CFCFRMS.
* **The "Golden UPI Rule" Enforcer:** Proactively detects common marketplace scams (OLX, Quikr) and reinforces the fundamental rule: **Entering a UPI PIN or scanning a QR code is strictly for SENDING money, NEVER for receiving money.**
* **Remote Access Scam Interception:** Educates users against installing malicious APKs (fake electricity bill updates, e-challan APKs) or remote-desktop utilities (AnyDesk, TeamViewer, RustDesk) requested by impersonators.
* **Zero PII Exposure Guardrails:** Sensitive inputs (16-digit card numbers, 6-digit OTPs, CVV, passwords) are masked prior to submission to external API inference layers.
* **Granite-Powered Reasoning:** Uses IBM's `granite-3-8b-instruct` to maintain concise, legally accurate, and hallucination-free financial advice.

---

##  IBM watsonx Resource Usage Verification (Slide 12 Proof)

As required by the Edunet evaluation rubric, all foundation model runs were executed on active IBM Cloud infrastructure:

* **Platform:** IBM watsonx.ai Studio / watsonx Runtime
* **Associated Service:** `watsonx.ai Runtime-ab`
* **Model ID:** `ibm/granite-3-8b-instruct`
* **Recorded Resource Consumption:** **~8,600 Tokens** (Tracked via *Manage > Resource usage > Tokens (Prompt Lab)*)
* **Compute Usage (CUH):** `0 CUH` *(Expected behavior for API-driven serverless foundation model generation)*

---

##  Repository File Structure

```text
FinLitBot-IBM-watsonx/
│
├── app.py                             # Core Flask application middleware & API routing
├── requirements.txt                   # Python package dependencies
├── .env.example                       # Environment variables template (API keys omitted)
├── .gitignore                         # Git exclusion rules (prevents secret leaks)
├── README.md                          # Complete project documentation & setup guide
├── SETUP_GUIDE.md                     # Step-by-step local execution instructions
│
├── templates/
│   └── index.html                     # Responsive, accessible Single Page Interface
│
├── static/
│   └── style.css                      # Modern CSS design system (Inter font, dark/light tones)
│
├── docs/
│   └── yourproblemstatement.pdf       # Formal AICTE Problem Statement #7 document
│
└── AICTE_IBM_BOB_Project_Submission_Template_for_EduentFoundation.pptx  # Final presentation deck
🛠️ Step-by-Step Local Setup & Execution Guide1. PrerequisitesPython 3.10, 3.11, or 3.12 installed on your machine.Git installed and configured.An active IBM Cloud account with access to watsonx.ai.2. Clone the RepositoryBashgit clone [https://github.com/Nayana-vm/FinLitBot-IBM-watsonx.git](https://github.com/Nayana-vm/FinLitBot-IBM-watsonx.git)
cd FinLitBot-IBM-watsonx
3. Create a Virtual Environment (Recommended)Bash# On Windows (PowerShell / Command Prompt):
python -m venv venv
venv\\Scripts\\activate

# On macOS / Linux:
python3 -m venv venv
source venv/bin/activate
4. Install DependenciesBashpip install --upgrade pip
pip install -r requirements.txt
5. Configure Environment VariablesCopy the .env.example file to create your local .env:Bashcp .env.example .env
Open .env and fill in your credentials:Code snippetWATSONX_APIKEY=your_ibm_cloud_iam_api_key_here
WATSONX_PROJECT_ID=cf0ca7b7-d874-4c48-9ef4-122f821fb663
WATSONX_URL=[https://us-south.ml.cloud.ibm.com](https://us-south.ml.cloud.ibm.com)
MODEL_ID=ibm/granite-3-8b-instruct
PORT=5000
FLASK_DEBUG=True
6. Launch the ApplicationBashpython app.py
7. Access FinLitBot in BrowserOpen your web browser and navigate to:http://localhost:5000/
   or
[http://127.0.0.1:5000/](http://127.0.0.1:5000/)
 Testing Prompts for EvaluationScenarioInput Query PromptExpected FinLitBot BehaviorMarketplace QR Scam"Someone on OLX is buying my sofa and sent a QR code telling me to scan and enter my UPI PIN to receive payment. Is this legit?"Intercepts scam; explains that UPI PINs are only used to debit money, never to credit.Emergency Golden Hour"Help! I clicked a fake electricity bill link and 50,000 was debited right now! What do I do?"Triggers immediate Golden Hour triage: Call 1930, notify bank nodal officer, preserve transaction reference / UTR.Screen Sharing Warning"Customer support asked me to install AnyDesk on my phone to process my refund. Should I?"Warns against AnyDesk/TeamViewer installation; details remote control risks and account takeover tactics.Financial Literacy"What is the 50/30/20 budgeting rule and how does an emergency fund help protect against cyber emergencies?"Provides structured financial planning guidance grounded in financial literacy fundamentals.📑 Edunet / AICTE Deliverables Checklist (Slide 22 Compliance)[x] Agent relevant files of IBM Cloud: Flask backend (app.py), UI templates, styling, requirements.[x] Problem Statement File: Uploaded as docs/yourproblemstatement.pdf.[x] Project Presentation: Uploaded as AICTE_IBM_BOB_Project_Submission_Template_for_EduentFoundation.pptx.[x] Resource Usage Proof: Slide 12 documented with before and after token metrics (~8,600 tokens).[x] Public GitHub Repository: https://github.com/Nayana-vm/FinLitBot-IBM-watsonx.📄 License & AcknowledgmentsThis project is developed as part of the AICTE – IBM SkillsBuild / Edunet Foundation Internship Program. Special thanks to the mentors and evaluators from IBM and Edunet Foundation for technical guidance on IBM watsonx.ai and the Granite model family."""with open("README.md", "w", encoding="utf-8") as f:f.write(readme_content.strip() + "\n")print("README.md created successfully!")
```text?code_stdout&code_event_index=1
README.md created successfully!

Your Markdown file is ready[file-tag: code-generated-file-49f037c0-ec94-4b0d-99e9-5c3c085c4fd1]Key Highlights Included in the README.mdProminently Highlighted HTTP & Port Details (as featured in your PPT):Protocol: HTTP/1.1Default Host: 127.0.0.1 (Localhost loopback) / 0.0.0.0 (All interfaces)Port: 5000 (Default Flask runtime) / 8080 (Configurable fallback)Live Access URLs: http://localhost:5000/ and [http://127.0.0.1:5000/](http://127.0.0.1:5000/)Complete API endpoint reference table (/, /api/chat, /api/triage, /api/calculate-emi, /api/health).watsonx Integration & Resource Tracking (Slide 12 Verification):Project ID: cf0ca7b7-d874-4c48-9ef4-122f821fb663Model: ibm/granite-3-8b-instruct (Dallas us-south cluster)Token Metric: Explicitly documents the ~8,600 tokens consumed via Prompt Lab and why 0 CUH is standard for serverless model inference.Complete Slide 22 Checklist Compliance:Includes repository structure matching the evaluation rubric (app.py, yourproblemstatement.pdf, projectpresentation.pptx, and templates).Sample prompt evaluation test cases for judges (Golden Hour 1930, UPI PIN scam detection, AnyDesk APK warning).
