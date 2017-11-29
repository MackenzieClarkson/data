# SOFE 3700U Project -  Hospital DBMS

## Install

After cloning the repository, replace local mysql login info to your host, user and password located 
in HospitalDBMS/config.js if needed.

Now install all NodeJS dependencies

NOTE: Make sure terminal is in the HospitalDBMS directory

```bash
npm install
```

To populate the database run the SQL script located at data/Data_project.sql.
The script will create the hospital schema, tables, views, and also populate the database.

Once this is done, start the server using

```bash
npm start
```

Navigate to http://localhost:3000 to view the site.the hcn of a user 


## Addtional Features

### Internal API:

JSON data for the room assignment of a patient can be found at the folowing url:

http://localhost:3000/doctors/patient/hcn

Where hcn is the HCN of a patient.

### External API:

The command:

```bash
npm run --script populate
```

will an externally hosted json file and populate the patient records table using the data.
