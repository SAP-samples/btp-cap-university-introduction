#import "files/templates/template.typ": *

#show: workshop-setup

// Title Page
#align(center)[
  #v(2cm)

  #image("files/intro-exercise/title-header.jpeg", width: 100%)

  #v(2cm)
]
#align(left)[

  #text(blue, size: 20pt, weight: "bold")[
    SAP BTP Pro-Code
  ]

  #text(size: 14pt)[
    Cloud Application Programming (CAP)
  ]

  #text(size: 12pt)[
    Version: #sys.inputs.at("version", default: "1.0.0")

    Date: January 14, 2026
  ]]


#pagebreak()

// Table of Contents
#outline(
  title: "Table of Contents",
  indent: auto,
)

#pagebreak()

#hint-block[
  *Note:* This workshop includes two optional advanced sections at the end:
  - *Optional: Advanced UI Customization* -- Enhance your UI with SideEffects, criticality highlighting, and conditional buttons
  - *Optional: Deployment to Cloud Foundry* -- Deploy your application to SAP BTP Cloud Foundry

  You may explore these sections based on your time and interest after completing the main exercise.
]

#pagebreak()

= Setup

+ Follow the #link-blue("https://pages.github.tools.sap/cap/docs/get-started/", "Getting Started Page") of the Capire Doc
+ Run VS Code and install the #link-blue("https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers", "DevContainer") extension or with:
    ```bash
    code --install-extension ms-vscode-remote.remote-containers
    ```
+ Download `cap-university-introduction.zip` release from #link-blue("https://github.com/SAP-samples/btp-cap-university-introduction/releases", "Releases")
+ Unzip `cap-university-introduction.zip`
+ Open `cap-university-introduction` with the following command if installed:
    ```bash
    code ./cap-university-introduction
    ```

#pagebreak()

= Task Description

Develop a comprehensive full-stack university management application using SAP Cloud Application Programming Model (CAP) that serves as a centralized system for managing academic operations. The application will handle the organization of academic programs (studies), course modules, and student enrollment in a structured and efficient manner.

This enterprise-grade solution will provide:

- *Study Program Management:* Organize and maintain different study programs (degrees) with their associated requirements including credits needed for completion, program duration, and curriculum structure

- *Module Catalog Management:* Define and manage course modules offered across study programs, including credit values, weights, validity periods, mandatory/elective status, exam options, and assignment tracking

- *Student Management:* Track students throughout their academic journey, managing their enrollment in study programs and registration for specific modules, maintaining comprehensive student records including personal information and academic progress

- *Module Assignment Tracking:* Enable students to register for available modules and manage their course selections, while enforcing business rules around module availability, prerequisites, and study program requirements

The system establishes clear relationships between Students, Studies (degree programs), and Modules, allowing for flexible curriculum design while maintaining data integrity.

== Helpful Links
While working on the task, feel free to use the following documentations *as much as possible*:

- #link-blue("https://cap.cloud.sap/docs/cds/", "CAPire (CAP Documentation)")
- #link-blue("https://experience.sap.com/fiori-design-web/", "Fiori development portal & Fiori elements documentation")

#pagebreak()

= Data Model

Use below diagram as a reference to design your CAP entities.

#image("files/intro-exercise/entity-diagram.drawio.png", width: 80%)

#pagebreak()

= Implementation

== Initialize CAP Application

Initialize your CAP application with the following command in the terminal either in VS Code or BAS:

```bash
cds init university --add nodejs
cd university
npm i
```

== Project Structure

Your project structure should look like this:

#image("files/intro-exercise/project-structure.png", width: 30%)

== File Structure Setup

Create the database schema file in `/db/`:
- `schema.cds`

Create service definition files in `/srv/`:
- `students-service.cds`
- `studies-service.cds`
- `modules-service.cds`

== Create Data Models

Create the data models in the `/db` folder based on the entity diagram. You can have a look at the #link-blue("https://pages.github.tools.sap/cap/docs/cds/cdl", "CDL documentation") for reference.

#hint-block[
  *Hint:* If you are stuck with the creation of the data model, please raise your hand. We are happy to help you.
]

== Create Example Data

Generate example data, adjust to your needs since this only contains UUIDs and not real content:

```bash
cd university
cds add data --records 10
```

== Test Data Models

Test if your data models are defined correctly and no compilation errors occur (You can leave this command running while working on the next steps):

```bash
cd university
cds watch
```
Only proceed to the next step if your compilation is successfull, otherwise have a closer look at your data model. In case you make changes to your model, you also may need to delete the `db/data` folder and recreate the example data or run `cds add data --records 10 --force` to force update the generated data.

== Create Services

Create the services in the `/srv/` folder, which expose the entities via API. Check out the #link-blue("https://cap.cloud.sap/docs/cds/cdl#services", "documentation") for how to define services.

- The studies service should expose the Studies entity
- The students service should expose the Students entity and the Studies entity.
- In the Students and Studies service enable draft for the respective entities to allow them being edited
- In the Module service expose the Modules entity as well as the ModuleAssignments entity, to show a list of modules students can sign up for

== Add Actions

Actions allow to define POST endpoints, which execute some logic when being called. Follow the #link-blue("https://cap.cloud.sap/docs/cds/cdl#actions", "docs") to add the bound actions "assign" and "unassign" to the Modules. Do not add an implementation for that yet. We will do that later.

== Create UI Applications

Create UI applications by using the Fiori Frontend Generator.

#hint-block[
  *Note:* You should repeat this step for each OData service, in total 3 times.
]

+ In the menu click *View → Command Palette* (`Ctrl + Shift + P` or `⌘ + Shift + P`) and start typing "Fiori" and select *Fiori: Open Application Generator*

+ Select *List Report Page* in the template section and click "Next"
  #image("files/intro-exercise/fiori-generator.png", width: 80%)

+ In *Data Source* select "Use a Local CAP Project":
  - Choose a CAP Project: `university`
  - OData Service: `YourService`

+ In the *Entity Selection* select:
  - Main Entity: `YourMainEntityOfTheService`
  - Navigation Entity: `YourNavigationEntity` (If applicable)
  - Automatically add table columns to the list page and a section to the object page if none already exists: *Yes*
  - Table Type: *Responsive*

+ In the *Project Attributes* select:
  - Module Name: e.g. `students-management` for the students-service
  - Application Title: e.g. "Students Management" for the students service
  - Application Namespace: empty
  - Description: `YourDescription`
  - Enable TypeScript: *No*
  - Add Fiori Launchpad Configuration: *Yes*
  - Use Virtual Endpoints for Local Preview: *No*
  - Configure Advanced Options: *No*

+ In the *SAP Fiori Launchpad Configuration*:
  - Semantic Object: `YourMainEntityOfTheService`
  - Action: `manage` (or something better fitting)
  - Title: Choose accordingly, will be displayed on the Launchpad tile
  - Subtitle: Choose accordingly, will be displayed on the Launchpad tile

+ Continue creating the Fiori config for the remaining services, once you finished, continue with the next step.

== Define UI Annotations

For defining the UI annotations, you can use the Fiori application modeler plugin icon: #image("files/intro-exercise/fiori-modeler-icon.png", height: 2em)

- Select the app you want to work on and select the page, e.g. either the list page or the details page
- Afterwards you can configure columns for tables or modify the sections shown on the details page
- *FYI, but not necessary:* You can also manually define the annotations in CDS files. Ideally use the `annotations.cds` file in each `app/` folder to do the annotations for the respective app:
  - `@UI.LineItem` specifies a table definition
  - `@UI.HeaderInfo` specifies the header of an object page as well as the table name
  - `@UI.PresentationVariant` specifies the default sorting for a table
  - `@UI.FieldGroup` specifies a form
  - `@UI.Facets` specifies the sections of an object page. Facets can contain field groups, line items or charts
  - You can check-out the #link-blue("https://ui5.sap.com/test-resources/sap/fe/core/fpmExplorer/index.html", "Fiori elements showcase") for samples of each annotation
- To disable the "Go" button in the UI add the "liveMode" setting in each applications `webapp/manifest.json` file. For more information, reference to the #link-blue("https://pages.github.tools.sap/cap/docs/advanced/fiori#live-mode", "docs")

== Add Local Launchpad

Add a local launchpad by running the following commands:

```bash
npm install express@^4 --save-peer
npm add -D cds-launchpad-plugin
```

Afterwards usually on localhost, port 4004 a "Sandbox Launchpad" appears, via which you can test the UI apps within the SAP Shell.

#align(center)[
  #image("files/intro-exercise/sandbox-launchpad-link.png", width: 90%)
]
#align(center)[
  #image("files/intro-exercise/sandbox-launchpad.png", width: 90%)
]

== Add Actions to UI

After the creation of the basic UI application, add Buttons to call the assign and unassign actions you created earlier. Again, use the Fiori Tools to open the Page Map of the catalog application or execute the Command *Fiori: Show Page Map* and select the catalog app.

Edit the Object Page:

#align(center)[
  #image("files/intro-exercise/fiori-editor.png", width: 100%)
]

- Under *Header → Actions → + on the right side → Add Actions* → Select the assign and unassign actions

If you now restart, go to the object page and click assign, you should get an error that an implementation is missing. We will add that later.

== Debug Your Application

You can start your application in debug mode by using a JavaScript Debug Terminal in VSCode and executing `cds watch` there.

== Adding Authorization and Authentication

You now want to restrict the catalog service so that only Students can see it. Read about auth in CAP #link-blue("https://pages.github.tools.sap/cap/docs/guides/authorization", "here").

CAP offers pre-defined mock users. We now want to overwrite one of them to add the role Student to the mock user alice. You can do it like this in your `package.json`:

```json
"cds": {
  "requires": {
    "[development]": {
      "auth": {
        "kind": "mocked",
        "users": {
          "alice": {
            "password": "1234",
            "roles": [
              "Student"
            ]
          }
        }
      }
    }
  }
}
```

== Adding Business Logic

Run the following commands to add the TypeScript configuration:

```bash
cds add typescript
npm install
```

Add a `/srv/modules-service.ts` file. CAP will automatically consider js/ts files with the same name as the service file.

```ts
import cds from "@sap/cds";
import { Module } from "#cds-models/ModulesService";

export class ModulesService extends cds.ApplicationService {
  init() {
    this.on(Module.actions.assign, async (req) => {
      console.log("Assign called", req.user);
    });

    return super.init();
  }
}
```

Implement the assign action that assigns the user to the Module. In case an assignment already exists, do not add one but return an error.

- You can leverage `req.subject` as a shortcut for the information which entity is targeted by the bound action
- You can use `req.user` to gain information about the logged in user
- `req.params` contains the URL parameters like the ID of the bound entity
- Use CAPs SQL like query API to do the necessary statements
- Use `req.info` to let the student know that you assigned them or `req.error` to display the error
- Make use of the debugger to inspect the incoming requests or results from database access

#v(2cm)
Congratulations! You just created your first CAP-Application.

#pagebreak()

= Optional: Advanced UI Customization

This section covers advanced UI enhancements to make your application more polished and user-friendly.

== Example UI Screenshots

The following screenshots show what your finished applications could look like:

*Students App:*
#align(center)[
  #image("files/intro-exercise/students-app-ui.png", width: 90%)
]

*Studies App:*
#align(center)[
  #image("files/intro-exercise/studies-app-ui.png", width: 90%)
]

*Module Catalog App:*
#align(center)[
  #image("files/intro-exercise/module-catalog-ui.png", width: 90%)
]

== Refresh UI with SideEffects

Use `@Common.SideEffects` to refresh parts of the UI when actions are executed. This ensures the UI reflects the latest data after an action like "assign" or "unassign" is pressed.

An example for having actions as a table column is given in the #link-blue("https://github.com/SAP-samples/fiori-elements-feature-showcase?tab=readme-ov-file#actions", "Fiori Elements Showcase").

== Multiple Tabs Configuration

Having multiple tabs can be configured via the #link-blue("https://github.com/SAP-samples/fiori-elements-feature-showcase?tab=readme-ov-file#multiple-table-mode", "manifest.json") file of your application. This allows you to organize different content sections in a tabbed interface.

== Row Highlighting with Criticality

Highlighting a row with color can be done via the so-called *Criticality* of the row (#link-blue("https://github.com/SAP-samples/fiori-elements-feature-showcase?tab=readme-ov-file#highlighting-line-items-based-on-criticality", "Sample")). Instead of a property reference, you can use an expression:

```cds
isUserAssigned
```

#hint-block[
  *Note:* #link-blue("https://sap.github.io/odata-vocabularies/vocabularies/UI.html#CriticalityType", "Criticality Values"): `3` = Positive,  `0` = Neutral
]

== Conditional Action Buttons

Annotating `@Core.OperationAvailable` to an action allows you to conditionally enable or disable the action button in the UI. You can specify a property from the bound entity or an expression.

```cds
@Capabilities.Deletable : false
@Capabilities.Insertable : false
entity Modules as projection on persistence.Modules {
  *,
  (exists assignments[student.userID = $user.id] ? true : false) as isUserAssigned: Boolean @(Ui.Hidden),
} actions {
  @(
    Core.OperationAvailable : (not $self.isUserAssigned),
    Common.SideEffects : {
      TargetProperties : ['in/isUserAssigned']
      TargetEnttities : ['/moduleCatalog.EntityContainer/ModuleAssignments']
    }
  )
  action assign();
}
```

#pagebreak()

= Optional: Deployment to Cloud Foundry

This section covers deploying your CAP application to SAP BTP Cloud Foundry.

== Add Production Configuration

Run the following commands to add the necessary configuration for production deployment:

```bash
cds add xsuaa,hana --for production
```

This adds the configuration for:
- *XSUAA:* Authentication & Authorization service
- *HANA:* SAP HANA Cloud database

```bash
cds add mta,workzone --for production
```

This adds the configuration for:
- *MTA:* Multi-Target Application deployment descriptor
- *Workzone:* Central entry point for SAP solutions (Launchpad)

== Fix ui5-deploy.yaml Configuration

#hint-block[
  *Important:* Due to a current bug, you need to manually add `relativePaths: true` to every generated `ui5-deploy.yaml` file, and add the `ui5-tooling-transpile-task`:
]

#align(center)[
  #image("files/intro-exercise/ui5-deploy-config.png", width: 80%)
]

== Cloud Foundry Login
TODO: Update to login to their instance based on what is available.

== Build and Deploy

Run the following commands to install dependencies and deploy your app to Cloud Foundry:

```bash
npm install
cds up
```

The `cds up` command bundles the build command from `mbt` with the `cf deploy` command for deployment.

== Access Deployed Apps

To list your deployed HTML5 applications, check your `mta.yaml` for a service name ending with `-destination`. Copy that name and run:

```bash
cf html5-list --di <destination-name> -u
```

This will list the three HTML5 archives of your apps. In the URLs shown, replace `cpp` with `launchpad` to access the applications.

#hint-block[
  *Note:* The Module catalogue app might not open if role restrictions are defined, depending on your landscape configuration.
]

== Cleanup / Undeploy

To undeploy your application and clean up resources, run:

```bash
cf undeploy <ID from mta.yaml> --delete-services
```

Replace `<ID from mta.yaml>` with the actual ID specified in your `mta.yaml` file.

#pagebreak()

= Further Reading

- #link-blue("https://learning.sap.com/", "SAP Learning")
