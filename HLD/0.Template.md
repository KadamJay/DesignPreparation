<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [System Design Steps](#system-design-steps)
  - [1. Gather Requirements](#1-gather-requirements)
  - [2. Discuss System Constraints](#2-discuss-system-constraints)
  - [3. Capacity Estimation](#3-capacity-estimation)
  - [4. Define System APIs](#4-define-system-apis)
  - [5. Draw Top-Level System Diagram](#5-draw-top-level-system-diagram)
  - [6. Discuss Database Design](#6-discuss-database-design)
  - [7. Prototype a Minimum Viable Product](#7-prototype-a-minimum-viable-product)
  - [8. Discuss Scaling](#8-discuss-scaling)
  - [9. Test and Review Your Design](#9-test-and-review-your-design)

<!-- /code_chunk_output -->


# System Design Steps

## 1. Gather Requirements

- **Use Case**: Identify the primary functions of the system.
- **Customer**: Determine who will use the system.
- **Purpose**: Understand why this system is needed.

## 2. Discuss System Constraints

- **Limitations**: Note what is not allowed or is restricted.
- **Permissions**: Define what the system is allowed to do.

## 3. Capacity Estimation

- **Traffic Estimation**:
  - Reads per second
  - Writes per second
- **Storage Estimation**: Estimate the storage needed for three years' worth of data.
- **Bandwidth Estimate**: Determine the bytes per second the system should handle, both incoming and outgoing.
- **Cache Estimate**: Estimate memory needed to cache popular read responses using the 80-20 rule.

## 4. Define System APIs

- **REST vs SOAP**: Choose RESTful mostly; read about differences between REST and SOAP.

## 5. Draw Top-Level System Diagram

- Include components like client, web servers, platform, database, and worker services.

## 6. Discuss Database Design

- **Schema Choice**: Decide between SQL or NoSQL based on requirements.

## 7. Prototype a Minimum Viable Product

- Design for a single user to test basic functionalities.

## 8. Discuss Scaling

- Identify bottlenecks and points of failure.
- Implement strategies like load balancing, caching, replication, message queues, and asynchronous workers.

## 9. Test and Review Your Design

- **Testing**: Treat it similarly to a coding interview; walk through the system to ensure it meets all customer needs.
- **APIs**: Confirm all customer requests are addressed by the APIs.
- **Failover Scenarios**: Discuss not just the typical use cases but also system failover scenarios.
- **System Boundaries**: Clearly delineate different parts of the system to explain functionalities.
