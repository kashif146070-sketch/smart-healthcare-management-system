# Smart Healthcare Management & Monitoring System (CarePlan)

A desktop/tablet-first Flutter application for managing healthcare software projects across multi-hospital networks (Appointments, Lab Reports, Doctor Schedules, Online Consultations, Billing).

## 🚀 Features & Modules

- **CarePlan Dashboard**: Project status overview, progress tracking, Earned Value snapshot, critical defects count, and milestone schedule.
- **Module 1: Initiation & Integration**: Project charter, baseline management plan, team responsibilities, and participating hospitals network.
- **Module 2: Scope Management & WBS**: Requirements register, change control workflow, and hierarchical Work Breakdown Structure (WBS).
- **Module 3: Schedule & Resource Management**: Activity timeline, predecessor dependencies, forward-pass scheduling engine, and automated delay detection.
- **Module 4: Cost Management & EVM**: EVM metrics (PV, EV, AC, CPI, SPI, Cost Variance), actual expenditure ledger, and performance tracking.
- **Module 5: Quality Management & Risk Control**: Defect register, deliverable quality checklists, and Risk Matrix with PDPC preventive/contingency responses.
- **Module 6: System Integration & Reporting**: Consolidated executive summary report and PDF report export.

## 🛠 Tech Stack

- **Framework**: Flutter (Desktop / Windows)
- **Database**: Drift (SQLite)
- **State Management**: Flutter Riverpod
- **Routing**: GoRouter
- **Charts**: Syncfusion Flutter Charts
- **PDF Export**: PDF & Printing packages

## 📦 Getting Started

1. Ensure Flutter SDK is installed.
2. Clone the repository:
   ```bash
   git clone https://github.com/kashif146070-sketch/smart-healthcare-management-system.git
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run -d windows
   ```
