# 🛫 SkyOps-RAP-BTP

> **Enterprise Flight Booking System** built on **SAP BTP ABAP Environment** using the **RESTful Application Programming Model (RAP)** with OData V4.

[![SAP BTP](https://img.shields.io/badge/SAP-BTP%20ABAP-0070F2?style=for-the-badge&logo=sap)](https://www.sap.com/products/technology-platform.html)
[![RAP](https://img.shields.io/badge/ABAP-RAP%20Model-FF6600?style=for-the-badge)](https://help.sap.com/docs/btp/sap-abap-restful-application-programming-model)
[![OData](https://img.shields.io/badge/OData-V4-00C176?style=for-the-badge)](https://www.odata.org/)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

---

## 🧭 Overview

**SkyOps-RAP-BTP** is a production-ready reference implementation of a **Flight Booking OData V4 REST API** — designed to demonstrate enterprise-grade ABAP RAP development patterns on SAP BTP.

Ideal for developers learning RAP, or organizations modernizing legacy ABAP to cloud-native BTP.

---

## ⚙️ Tech Stack

| Layer | Technology |
|---|---|
| ☁️ Platform | SAP BTP, ABAP Environment (Steampunk) |
| 🧱 Programming Model | ABAP RAP — Managed BO |
| 🔌 API Protocol | OData V4 |
| 🖥️ UI | SAP Fiori Elements (List Report + Object Page) |
| 🧪 Testing | ABAP Unit Tests |
| 🛠️ Tooling | Eclipse ADT |

---

## 📁 Project Structure

```
SkyOps-RAP-BTP/
│
├── src/
│   ├── db/
│   │   └── ZFLIGHTBOOKING.tabl.abap          # Transparent DB Table
│   ├── cds/
│   │   ├── ZI_FlightBooking.ddls.asddls       # Interface CDS View (BO Root)
│   │   └── ZC_FlightBooking.ddls.asddls       # Consumption View (Projection)
│   ├── behavior/
│   │   ├── ZI_FlightBooking.bdef.asbdef       # Behavior Definition
│   │   └── ZBP_FlightBooking.clas.abap        # Behavior Implementation
│   └── tests/
│       └── ZTEST_FlightBooking.clas.abap      # ABAP Unit Tests
│
├── docs/
│   ├── architecture.md                        # System Architecture Diagrams
│   └── setup-guide.md                         # Step-by-Step Deployment Guide
│
└── README.md
```

---

## ✅ Features

| Feature | Status |
|---|---|
| Managed RAP BO with UUID keys | ✅ |
| Full CRUD via OData V4 | ✅ |
| Custom Actions — `BookFlight`, `CancelFlight` | ✅ |
| Field Validations — Date, Email, Seat | ✅ |
| Determinations — Auto BookingID, Price, Status | ✅ |
| Draft Handling (Fiori Edit/Save pattern) | ✅ |
| Instance Feature Control (dynamic button enable/disable) | ✅ |
| ABAP Unit Tests | ✅ |
| Fiori Elements UI (List Report + Object Page) | ✅ |

---

## 🔄 Booking State Machine

```
  ┌─────────┐   BookFlight    ┌──────────┐
  │  Open   │ ──────────────► │  Booked  │
  │  ( O )  │                 │  ( B )   │
  └─────────┘                 └────┬─────┘
                                   │ CancelFlight
                              ┌────▼─────┐
                              │Cancelled │
                              │  ( C )   │
                              └──────────┘
```

---

## 🚀 Quick Start

See **[docs/setup-guide.md](docs/setup-guide.md)** for the full deployment walkthrough.

### Prerequisites
- SAP BTP Trial → [cockpit.hanatrial.ondemand.com](https://cockpit.hanatrial.ondemand.com)
- Eclipse IDE with ADT plugin
- ABAP Environment instance on BTP

---

## 🏗️ Architecture

See **[docs/architecture.md](docs/architecture.md)** for the full layered architecture diagram.

---

## 📄 License

MIT License — free to use, fork, and build upon.

---

## 👤 Author

**Your Name**
- 🐙 GitHub: [@yourusername](https://github.com/yourusername)
- 💼 LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourlinkedin)
- 📧 Email: you@example.com

---

> ⭐ **Star this repo** if SkyOps-RAP-BTP helped you on your SAP BTP journey!
