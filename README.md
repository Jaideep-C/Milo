# Milo (Emergency Ambulance System) 

A new Flutter project for the ineuron.ai Hack-A-Thon 2.0. This project is intended as a solution to the Ambulance problem statement.

## Full stack server-less architecture
```mermaid
graph LR
A[Flutter]--API-->B((Firebase))
B-->C[Firestore]
B-->D[Firebase Cloud Functions]
B-->E[Firebase Authentication]
A--Geolocation-->F((GCP Maps SDK))
