// SAP BTP & Cloud Application Programming Model Presentation
// Using Touying for presentation slides

#import "@preview/touying:0.6.1": *
#import themes.university: *
#import "template-presentation.typ": *

// Apply presentation template with SAP branding
#show: presentation-setup.with(
  title: [SAP BTP & Cloud Application\ Programming Model],
  subtitle: [University Introduction],
  author: [Simon Engel, Simon Kobler, Marten Schiwek],
  date: datetime.today(),
  institution: [SAP],
)

// ============================================================================
// TITLE SLIDE
// ============================================================================
#title-slide()

// ============================================================================
// AGENDA
// ============================================================================
== Agenda

#slide[
  #v(3em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 4em,
    [
      *Part 1: SAP Business Technology Platform*
      - What is BTP?
      - Platform Overview
      - Key Capabilities

      #v(1.5em)

      *Part 2: SAP Cloud Application Programming Model*
      - Introduction to CAP
      - Domain Modeling with CDS
      - Service-centric Architecture
    ],
    [
      *Part 3: SAP Fiori Elements*
      - Framework Overview
      - Floorplans & Building Blocks
      - Enterprise Features

      #v(1.5em)

      *Part 4: Practical Exercise*
      - Hands-on Development
      - Testing & Deployment
    ],
  )
]

// ============================================================================
// SECTION: SAP BUSINESS TECHNOLOGY PLATFORM
// ============================================================================
= SAP Business Technology Platform

== What is SAP Business Technology Platform?

#slide[
  #grid(
    columns: (1fr, 200pt),
    gutter: 2em,
    [
      #v(2em)
      BTP is SAP's platform providing a *unified environment* for application development, process automation, infusion of AI capabilities, and extension of existing SAP (and non-SAP) applications in the cloud to empower businesses in the SAP-context.

      It is a *comprehensive platform* allowing organizations to:

      #set text(size: 14pt)
      *Integrate and extend business applications faster*
      - Connect systems and processes across the enterprise, reduce development effort, and accelerate time to value with prebuilt integrations and workflows.
      *Create business-relevant apps with all your data*
      - Effortlessly integrate with SAP Business Data Cloud to build smarter applications and develop reliable AI solutions grounded in up-to-date business context.
      *Innovate and accelerate with AI*
      - Boost developer productivity with generative AI, securely infuse AI models into applications, and develop reliable AI solutions at scale.
    ],
    [
      #align(right)[
        #block(
          clip: true,
          radius: 8pt,
          image("files/presentation/btp-cockpit-demo.png", width: 200pt, height: 90%),
        )
      ]
    ],
  )
]

== SAP Business Technology Platform Overview

#slide[
  #v(3em)

  #align(center)[
    #block(fill: white, radius: 8pt, inset: 8pt)[
      #image("files/presentation/btp-hyperscaler-overview.svg", height: 70%)
    ]
  ]
]

== SAP Business Technology Platform

#slide[
  #v(3em)

  #align(center)[
    #block(fill: white, radius: 8pt, inset: 8pt)[
      #image("files/presentation/btp-organization-overview.svg", height: 70%)
    ]
  ]
]

== Demo

#focus-slide(background-color: rgb("#0070F2"))[

  #grid(
    columns: (1fr, 200pt),
    gutter: 2em,
    [
      #text(size: 48pt, weight: "bold", fill: white)[Demo]
    ],
    [
      #align(right)[
        #block(
          image("files/presentation/btp-laptop.png", width: 400pt),
        )
      ]
    ],
  )
]

== SAP BTP App Dev & Automation Cloud Services

#slide[
  #v(3em)

  #align(center)[
    #image("files/presentation/app-dev-and-automation.svg", height: 75%)
  ]
]

== SAP BTP Data and Analytics Cloud Services

#slide[
  #v(3em)

  #align(center)[
    #image("files/presentation/btp-data-and-analytics.svg", height: 75%)
  ]
]

== SAP BTP Integration Cloud Services

#slide[
  #v(3em)

  #align(center)[
    #image("files/presentation/btp-integration-cloud-services.svg", height: 75%)
  ]
]

== SAP BTP AI Cloud Services

#slide[
  #v(3em)

  #align(center)[
    #image("files/presentation/btp-ai-cloud-service.svg", height: 75%)
  ]
]

== SAP BTP Platform Foundation Cloud Services

#slide[
  #v(3em)

  #align(center)[
    #image("files/presentation/btp-platform-foundation-cloud-services.svg", height: 75%)
  ]
]

== BTP Sample Architecture using CAP

#slide[
  #v(3em)

  #align(center)[
    #image("files/presentation/btp-sample-architecture.svg", height: 85%)
  ]
]

// ============================================================================
// SECTION: SAP CLOUD APPLICATION PROGRAMMING MODEL
// ============================================================================
= SAP Cloud Application Programming Model

== Introduction to CAP

#slide[
  #v(0.5em)
  The *SAP Cloud Application Programming Model* is a framework of languages, libraries, and tools for building *enterprise-grade* services and applications.

  #v(1em)

  #grid(
    columns: 2,
    gutter: 4em,
    [
      *Key Components:*
      - CDS (Core Data Services)
      - Service SDKs
      - REST / OData protocols
      - SAP Fiori integration
      - SAP HANA support
    ],
    [
      *Runtimes:*
      - Java (Spring Boot)
      - Node.js (Express)

      *Tools:*
      - VS Code
      - IntelliJ
      - CLI (`cds`)
    ],
  )

  #v(1.5em)
  #align(center)[
    #link("https://cap.cloud.sap")[https://cap.cloud.sap]
  ]
]

== What is CAP?

#slide[
  #v(0.5em)
  CAP complements cloud-native technologies with:

  #grid(
    columns: 2,
    gutter: 3em,
    [
      *Core Concepts:*
      - *Domain-driven Modelling* powered by CDS
      - *Services & Events* centric paradigm
      - *Proven best practices* served out-of-the-box
      - 1st-class support for SAP Fiori and HANA Cloud
    ],
    [
      *Key Benefits:*
      - *Evolutionary Development* - Jumpstart & Grow as you go
      - *Local Development Model* - Fast turnaround times
      - *Enterprise & Cloud Qualities* - MT, Resilience, Extensibility
      - *Evolution w/o Disruption* - Safeguarded Investments
    ],
  )

  #v(1.5em)
  #align(center)[
    #rect(fill: rgb("#E3F2FD"), radius: 4pt, inset: 1em)[
      *Primary Focus on Domain* - Capturing _Intent_ - *What, not how!*
    ]
  ]
]

== CAP Architecture Overview

#slide[
  #align(center)[
    #image("files/presentation/cap-framework.png", height: 85%)
  ]
]

== Enterprise Services - Out of the Box

#slide[
  #v(0.5em)
  CAP provides enterprise services *out-of-the-box*, minimizing tedious recurring tasks:

  #v(1.5em)

  #grid(
    columns: 3,
    gutter: 2em,
    [
      *APIs & Data*
      - OData-based APIs
      - Input Validation
      - Streaming and Media
    ],
    [
      *Security & Tenancy*
      - Multi-Tenancy
      - Extensibility
      - Authentication & Authorization
      - Data Privacy
    ],
    [
      *Localization*
      - Localization / i18n
      - Localized Data
      - Temporal Data
    ],
  )

  #v(1.5em)
  #align(center)[
    See full Feature Matrix at #link("https://cap.cloud.sap")[cap.cloud.sap]
  ]
]

== Core Data Services (CDS)

#slide[
  #v(0.5em)
  *Cloud Qualities by Design* - Guiding developers to reach crucial cloud qualities through proven best practices

  #v(1.5em)

  *CAP Service-centric Core:*

  - *Domain Modelling* powered by CDS - fueling generic providers - _What, not How_
  - *Pervasive Services* - every active thing is a service - stateless
  - *Ubiquitous Events* - services intrinsically handle events, synchronous + async
  - *Powerful Querying* - services expose de-normalized views - push down/across
  - *Agnostic APIs* - services are agnostic to both protocols and platforms
]

== Guiding Principles

#slide[
  #v(0.5em)
  #grid(
    columns: 2,
    gutter: 3em,
    [
      *Work in Inner Loops* as much as possible:

      - `cds mock` platform services as well as remote business services
      - `cds bind` to cloud or backends only when required
      - `cds deploy` to cloud only when required

      #v(1em)

      *Key Practices:*
      - Contracts/APIs First
      - Late-cut Microservices
      - Reuse, Compose & Extend
    ],
    [
      *Jumpstart & Grow as you go:*

      - `cds init` starts projects w/o upfront setup
      - `cds watch` full-fledged servers from the beginning
      - `cds add` more things only when required

      #v(1em)

      #rect(fill: rgb("#E8F5E9"), radius: 4pt, inset: 1em)[
        *Convention over Configuration*

        Inner loop development: ~1 second turnaround
      ]
    ],
  )
]

== Demo

#focus-slide(background-color: rgb("#0070F2"))[
  #text(size: 48pt, weight: "bold", fill: white)[Demo]

  #v(0.5em)
  #text(fill: white)[_CAP Development Experience_]
]

// ============================================================================
// SECTION: DOMAIN MODELING IN CAP
// ============================================================================
= Domain Modeling in CAP

== Focus on Domain, Powered by CDS

#slide[
  #v(0.5em)
  *Capture Intent* - that is _What, not How_ - in *concise* and *comprehensible* models

  Promoting close collaboration of *developers* and *domain experts* to iteratively refine domain knowledge

  #v(1em)

  #grid(
    columns: 2,
    gutter: 3em,
    [
      *Key Concepts:*
      - *Entities & Views* - capture data-centric aspects
      - *Services & Events* - capture behavioral aspects (APIs)
      - *Associations* - capture relationships
      - *Aspects* - separation of concerns, extensibility
      - *Annotations* - semantic enrichment
    ],
    [
      *Declarative Approach* fueling generic runtimes:

      #set text(size: 15pt)
      Domain models #sym.arrow.b \
      Service models #sym.arrow.b \
      UI Markup (annotations) #sym.arrow.b \
      CAP Generic Runtime #sym.arrow.b \
      SAP HANA Cloud
    ],
  )
]

== Conceptual Modelling with CDS

#slide[
  #v(0.3em)
  #grid(
    columns: (0.9fr, 1.3fr),
    gutter: 2em,
    [
      *Step 1: Capture a Domain Model*

      Using CDS entities, Associations, and higher-level constructs

      #v(0.8em)

      *Benefits:*
      - Conceptual Modelling: concise and comprehensible
      - Promoting Domain-driven Design
      - Close collaboration of developers and domain experts
    ],
    [
      ```cds
      namespace capire.bookshop;

      entity Books {
        key ID    : Integer;
        title     : localized String;
        descr     : localized String;
        author    : Association to Authors;
        genre     : Association to Genres;
        price     : Decimal;
      }

      entity Authors {
        key ID    : Integer;
        name      : String;
        books     : Association to many Books;
      }

      entity Genres : cuid, CodeList {
        children  : Composition of many Genres;
      }
      ```
    ],
  )
]

== Aspect-oriented Modelling

#slide[
  #v(0.3em)
  #grid(
    columns: (0.9fr, 1.3fr),
    gutter: 2em,
    [
      *Step 2: Use CDS Aspects*

      For separation of concerns, verticalization, and extensions

      #v(0.8em)

      *Benefits:*
      - Factor out separate concerns
      - Keep domain models concise
      - Same or separate files/projects
      - Different owners and lifecycles
      - Verticalization & Customization
    ],
    [
      ```cds
      // constraints and technical details
      extend Orders with temporal, managed;

      annotate Authors with @(
        assert.unique: [ name ]
      );

      annotate Books with {
        genre @assert.range: #enums;
      }

      // pre-built extension package
      using ….Books from '@capire/bookshop';
      using ….Reviews from '@capire/reviews';

      extend Books with {
        reviews : Composition of many Reviews;
        rating  : type of Reviews.Rating;
      }
      ```
    ],
  )
]

== Modelling Services/APIs

#slide[
  #v(0.3em)
  #grid(
    columns: (0.9fr, 1.3fr),
    gutter: 2em,
    [
      *Step 3: Add Service Models*

      As APIs and facades to consumers, capturing behavioral aspects

      #v(0.8em)

      *Key Principles:*
      - Service-centric Paradigm: every active thing is a (stateless) Service
      - Powerful View Building: expose denormalized views
      - Single-purposed 'Nano' Services: 1 service per use case
    ],
    [
      ```cds
      using capire.bookshop as my from './schema';

      // for browsing by end users
      service CatalogService {
        entity Books as projection on my.Books {
          *, author.name as author
        } excluding {
          createdBy, modifiedBy
        }
        action submitOrder (book, amount);
        event news : array of { book, info };
      }

      // for maintenance by administrators
      service AdminService {
        entity Books as projection on my.Books;
        entity Authors as projection on my.Authors;
      }
      ```
    ],
  )
]

== Semantic Enrichment with Annotations

#slide[
  #v(0.3em)
  #grid(
    columns: (0.9fr, 1.3fr),
    gutter: 2em,
    [
      *Step 4: Using Annotations*

      For semantic enrichment for various contexts and consumers

      #v(0.8em)

      *Use Cases:*
      - *UI Markup* - Fiori UIs served completely from CDS Models
      - *Analytics Markup* - For Embedded Analytics and SAP Analytics Cloud
      - *Custom Vocabularies* - Define your own annotation vocabularies

      #v(0.5em)
      #set text(size: 14pt)
      _Combined with Aspects: in separate models, possibly in separate projects_
    ],
    [
      ```cds
      // Fiori Markup
      annotate Books with @(
        UI.SelectionFields: [
          ID, title, price
        ],
        UI.LineItem: [
          { Value: title, Label: 'Book Title' },
          { Value: author, Label: 'Author' },
          { Value: price, Label: 'Price' },
        ]
      );

      // Analytics annotations
      annotate Sales with @(
        Aggregation.ApplySupported: {
          PropertyRestrictions: true
        }
      );
      ```
    ],
  )
]

// ============================================================================
// SECTION: SERVICE-CENTRIC & EVENT-DRIVEN ARCHITECTURE
// ============================================================================
= Service-centric & Event-driven Architecture

== Everything is a Service

#slide[
  #v(0.5em)
  Every *active* thing in CAP is a *Service*:

  - Always stateless, acting on passive data - _scalability_
  - Reflecting individual use cases - _'nano services'_
  - Acting as facades for consumers to access data
  - Including technical/framework services in CAP
  - Exchanging messages via uniform APIs
  - Synchronously as well as asynchronously
  - Locally as well as remotely (via proxies)

  #v(1em)

  #rect(fill: rgb("#E3F2FD"), radius: 4pt, inset: 1em)[
    *Promoting Scalability* through stateless, pure functions acting on passive data
  ]
]

== Single-purposed Services

#slide[
  #v(0.3em)
  ```cds
  // for end users to browse and shop books…
  service CatalogService {
    entity Books as projection on my.Books;
    action addToBasket (book: Books:ID, quantity: Integer);
  }

  // for admins to maintain everything ...
  service AdminService @(requires:'admin') {
    entity Books as projection on my.Books;
    entity Authors as projection on my.Authors;
  }
  ```

  #v(1em)

  #grid(
    columns: 2,
    gutter: 4em,
    [
      *Modularize with 'Nano' Services*

      Rule of thumb: one per use case / UI5 app
    ],
    [
      *Benefits:*
      - Provide reusable services
      - Plug in custom-defined tech services
      - Clear separation of concerns
    ],
  )
]

== Services as Facades

#slide[
  #v(0.3em)
  #grid(
    columns: (0.8fr, 1.3fr),
    gutter: 2em,
    [
      *Services expose restricted APIs* with denormalized projections on underlying entities

      #v(1em)

      ```
      Consumers
          |
          v
      Service A --> Database
          |
          v
      Service B
      ```
    ],
    [
      ```javascript
      // some consumer code…
      const cats = cds.connect.to('CatalogService')

      let books = await cats.read('Books')

      for (let book of books) {
        if (userLikesBook(book)) {
          await cats.addToBasket(book.ID, 1)
        }
      }
      ```
    ],
  )
]

== Uniform APIs

#slide[
  #v(0.3em)
  All services support *common APIs* to consume and implement services:

  #v(1em)

  ```javascript
  // consuming services, including own provided ones …
  let books = await CatService.read('Books')   // CRUD style
  let books = await CatService.get('/Books')   // REST style

  // implementing provided services…
  CatService.on('READ', 'Books', async (req) => {
    const books = await SELECT.from('Books').where({ available: true })
    return books
  })

  // intercepting consumed services…
  db.on('READ', '*', (req, next) => {
    console.log('Reading:', req.target.name)
    return next()
  })
  ```
]

== Late-cut Microservices

#slide[
  #v(0.3em)
  *Cut microservices only when requirements are clear or change*

  #v(1em)

  ```javascript
  // consuming remote services…
  const ReviewsService = cds.connect.to('reviews-srv')
  let reviews = await ReviewsService.read('Reviews')
  ```

  #v(0.5em)

  ```yaml
  cds:  # config remote services
    requires:
      reviews-srv:
        kind: rest
        credentials:
          url: https://reviews-api.example.com
  ```

  #v(1em)

  Services work *locally or remotely* - same code, different deployment
]

== Events Overview

#slide[
  #v(0.5em)
  Everything happening at runtime is through *Events*:

  - *Synchronous & asynchronous* Event Messages
  - *Uniform subscriptions* through Event Handlers
  - *Locally as well as remotely* via Message Brokers
  - *Messaging service* - low-level messaging
  - *Declared events* - domain/app-level messaging

  #v(1.5em)

  #rect(fill: rgb("#FFF3E0"), radius: 4pt, inset: 1em)[
    CAP services are *intrinsically event-enabled* - blurring the lines between synchronous and asynchronous communication
  ]
]

== Event Handlers

#slide[
  #v(0.3em)
  Implement custom logic via *event handlers* with three hooks:

  #v(0.5em)

  #align(center)[
    #image("files/presentation/event-handlers.png", height: 65%)
  ]
]

== What is OData?

#slide[
  #v(0.5em)
  #grid(
    columns: 2,
    gutter: 4em,
    [
      *REST (Traditional):*
      - Purpose-built endpoints
      - `/listOfJobs`
      - `/job({ID})`
      - `/users({ID})/jobs({ID})`

      *Issues:*
      - Prone to overfetching
      - Tedious to implement API
      - Often lacks capabilities
    ],
    [
      *OData:*
      - Builds on top of REST
      - Open Standard since Version 4 (2014)
      - Unified general-purpose CRUD interface
      - Rich metadata via annotations
      - Exposes Entity Data Model (EDM)

      *Capabilities:*
      - `$select`, `$orderby`, `$filter`
      - `$top`, `$skip`, `$expand`
      - Specify exactly what's needed
    ],
  )
]

== Powerful Querying with CQN

#slide[
  #v(0.3em)
  Services act as *facades*, exposing *simplified, de-normalized views*

  Runtimes *translate queries* between protocols and apply projections recursively

  #v(0.5em)

  ```sql
  -- OData Request:
  -- GET /Authors?$select=ID,name&$expand=books($select=ID,title)

  -- CQN (CDS Query Notation):
  SELECT from Authors {
    ID, name, books { ID, title, price, currency.code }
  }

  -- Native SQL generated:
  SELECT ID, name from Authors;
  SELECT ID, title, price, currency_code from Books
    LEFT JOIN Currencies ON Currencies.code = Books.currency_code;
  ```
]

// ============================================================================
// SECTION: CAP PLUGINS
// ============================================================================
= Plugins in CAP

== Calesi Design Pattern

#slide[
  #v(0.5em)
  *CAP-level Service Integrations* - Extend your CAP application with plugins

  #v(1em)

  *Contributors:*
  - SAP BTP technology units and service teams
  - SAP application teams
  - Partners & Customers
  - CAP community

  #v(1em)

  *Plugin Examples:*
  #grid(
    columns: 3,
    gutter: 2em,
    [
      *Audit-Logging*

      Track data access and changes
    ],
    [
      *Attachments*

      File upload and management
    ],
    [
      *Notifications*

      Push notifications service
    ],
  )

  #v(1em)
  Find more plugins at #link("https://cap.cloud.sap")[cap.cloud.sap]
]

== Example: Audit Logging Plugin

#slide[
  #v(0.3em)
  *Adding the audit-logging plugin:*

  #v(0.8em)

  *Step 1:* Add dependency (self-configures plugin package)
  ```bash
  npm add @cap-js/audit-logging
  ```

  #v(0.8em)

  *Step 2:* Annotate model with `@PersonalData` annotation
  ```cds
  entity Customers @PersonalData {
    key ID    : UUID;
    name      : String @PersonalData.IsPotentiallyPersonal;
    email     : String @PersonalData.IsPotentiallyPersonal;
    address   : String @PersonalData.IsPotentiallyPersonal;
  }
  ```

  #v(0.8em)

  That's it! Audit logging is now enabled automatically.
]

// ============================================================================
// SECTION: SAP FIORI ELEMENTS
// ============================================================================
= Using SAP Fiori Elements

== SAP Fiori Overview

#slide[
  #v(0.5em)
  *SAP Fiori covers several dimensions:*

  #v(1em)

  #grid(
    columns: 3,
    gutter: 2em,
    [
      *Design System*
      - SAP Fiori Design Guidelines
      - Values, Principles & Practices
      - Design Language, Foundations
      - Components, Patterns
    ],
    [
      *Products*
      - My Home / SAP Start
      - SAP Build Work Zone
      - SAP Mobile Start
      - Joule
    ],
    [
      *Tools & Technologies*
      - SAPUI5
      - SAP Fiori elements
      - SAP Web Components
      - SAP Fiori tools
    ],
  )

  #v(1.5em)

  #rect(fill: rgb("#E3F2FD"), radius: 4pt, inset: 1em)[
    We will focus on building SAPUI5-based web apps using *SAP Fiori elements* and *SAP Fiori tools*
  ]
]

== Why SAP Fiori Elements?

#slide[
  #v(0.5em)
  *SAP Fiori elements makes it faster and easier to build SAPUI5 apps:*

  #v(1.5em)

  #grid(
    columns: 3,
    gutter: 2em,
    [
      #rect(fill: rgb("#E8F5E9"), radius: 4pt, inset: 1em, height: 10em)[
        #align(center)[*Boosts Developer\ Productivity*]

        #v(0.5em)

        Build SAP Fiori apps faster using the same framework that SAP uses
      ]
    ],
    [
      #rect(fill: rgb("#E3F2FD"), radius: 4pt, inset: 1em, height: 10em)[
        #align(center)[*Drives UX\ Consistency*]

        #v(0.5em)

        Spend more time on business logic, less time coding the UI
      ]
    ],
    [
      #rect(fill: rgb("#FFF3E0"), radius: 4pt, inset: 1em, height: 10em)[
        #align(center)[*Enables Enterprise\ Readiness*]

        #v(0.5em)

        Enterprise-grade functionality users expect, without extra development
      ]
    ],
  )
]

== What is SAP Fiori Elements?

#slide[
  #v(0.5em)
  SAP Fiori elements is a *pro-code framework*, based on *SAPUI5*, aimed at *developers* to rapidly create SAP Fiori applications following SAP's design system and principles.

  #v(1em)

  *Key Features:*
  - Pre-defined building blocks and floorplans for common application types
  - Includes features like accessibility, UX-consistency
  - Allows developers to focus on business logic
  - Simple OData/annotation driven approach

  #v(1em)

  *Data Sources:*
  - *CAP:* Cloud Application Programming Model (cloud applications)
  - *RAP:* ABAP RESTful Programming Model (ABAP environment)
]

== Standard Floorplans

#slide[
  #v(0.5em)
  Most enterprise use cases involve providing an overview, lists of business objects, and management:

  #v(1em)

  #grid(
    columns: 2,
    gutter: 4em,
    [
      *Main Floorplans:*
      - *List Report Page* - Display business objects
      - *Object Page* - Manage business objects
      - *Analytical List Page* - Filter visually
      - *Overview Page* - Review business relevant data
    ],
    [
      *Additional:*
      - *Work List Page* - View tasks
      - *Forms Page* - Enter data
      - *Custom Page* - Full flexibility
    ],
  )

  #v(1em)

  #align(center)[
    #image("files/presentation/fiori-floorplans.png", height: 30%)
  ]
]

== Building Blocks

#slide[
  #v(0.5em)
  *Building blocks* give you the *flexibility* to create layouts or customize floorplans that fit your business requirements.

  #v(1.5em)

  *Benefits:*
  - Reusable artifacts consistently orchestrated by the framework
  - Automatic compatibility with SAP Fiori design standards
  - Standard application behavior (draft handling, side effects)
  - Lower maintenance costs

  #v(1.5em)

  *Examples:* Filter Bar, Table, Chart, Form, Header, Field
]

== UX Consistency

#slide[
  #v(0.5em)
  *UX Consistency includes:*

  #v(1.5em)

  #grid(
    columns: 3,
    gutter: 2em,
    [
      *Look and Feel*
      - Colors
      - Icons
      - Fonts
      - Dimensions
      - Motion design
    ],
    [
      *Controls & Floorplans*
      - UI components
      - Layout patterns
      - Page structures
    ],
    [
      *Behaviors & Interactions*
      - Save, Cancel actions
      - Filtering, Sorting
      - Confirmation dialogs
      - Navigation patterns
    ],
  )
]

== Enterprise-ready Features

#slide[
  #v(0.5em)
  *SAP Fiori elements enables enterprise-ready apps out of the box:*

  #v(1.5em)

  #grid(
    columns: 3,
    gutter: 2em,
    [
      *Data Features:*
      - Personalization
      - Export to Excel
      - Object Details
      - Variant management
      - Data Lists
      - Filtering, Sorting, Search
    ],
    [
      *Enterprise Features:*
      - Accessibility
      - Internationalization
      - Mobile compatibility
      - Responsiveness
      - Performance optimizations
    ],
    [
      *Technical Features:*
      - Integration
      - Security checks
      - Lifecycle stability
      - Test automation support
    ],
  )
]

== Draft Handling

#slide[
  #v(0.5em)
  *Draft handling in SAP Fiori elements:*

  #v(1em)

  #grid(
    columns: (1fr, 1.2fr),
    gutter: 2em,
    [
      *Features:*
      - Edit button triggers draft mode
      - Locking mechanisms to prohibit simultaneous editing
      - Keep unsaved changes while editing
      - Edit status filter to find drafts
      - Automatic draft cleanup
    ],
    [
      *How it works:*
      ```
      1. User clicks "Edit"
      2. Draft copy created
      3. Changes saved to draft
      4. User clicks "Save"
      5. Draft merged to active
      6. Draft deleted
      ```
    ],
  )
]

== Development Approaches

#slide[
  #v(0.5em)
  *Several ways to build SAPUI5 apps - these are AND not OR:*

  #v(1em)

  #grid(
    columns: 3,
    gutter: 1.5em,
    [
      #rect(fill: rgb("#E8F5E9"), radius: 4pt, inset: 1em)[
        *FLOORPLANS*

        Best when app is close to standard pattern

        - Reduce time/coding
        - Match SAP apps
      ]
    ],
    [
      #rect(fill: rgb("#E3F2FD"), radius: 4pt, inset: 1em)[
        *BUILDING BLOCKS*

        Best to add standard functionality to custom page

        - Speed development
        - Combine for complex designs
      ]
    ],
    [
      #rect(fill: rgb("#FFF3E0"), radius: 4pt, inset: 1em)[
        *SAPUI5 CONTROLS*

        Best for full control of every item

        - Complete customization
        - More maintenance
      ]
    ],
  )

  #v(1.5em)
  #align(center)[
    *Efficiency* #sym.arrow.l SAP Fiori elements | Freestyle SAPUI5 #sym.arrow.r *Flexibility*
  ]
]

== SAP Fiori Tools

#slide[
  #v(0.5em)
  *SAP Fiori tools simplifies building SAP Fiori elements and SAPUI5 freestyle apps:*

  #v(1em)

  - *Generates* the project environment for development
  - *Provides* step-by-step development instructions and code snippets
  - *Allows editing* of app structure: pages, content, properties, navigation
  - *Delivers code completion* using language server protocol for annotations
  - *Provides preview* in browser with mock or live data
  - *Offers troubleshooting tips* (open source)
  - *Creates apps from requirements* using GenAI
]

== SAP Fiori Elements in a Nutshell

#slide[
  #v(1em)
  #align(center)[
    #rect(fill: rgb("#E3F2FD"), radius: 8pt, inset: 1.5em)[
      #text(size: 24pt, weight: "bold")[App = OData + Annotations]

      #v(0.8em)

      The UI is generated at runtime based on floorplans, building blocks, and custom SAPUI5 code
    ]
  ]

  #v(1.5em)

  #grid(
    columns: 3,
    gutter: 2em,
    [
      *Development Framework*

      Based on SAPUI5
    ],
    [
      *Flexible*

      Extend via building blocks and custom code
    ],
    [
      *Enterprise-ready*

      Accessibility, responsiveness, security built-in
    ],
  )
]

// ============================================================================
// SECTION: BREAK
// ============================================================================
= Break

#focus-slide(background-color: rgb("#1B4F72"))[
  #text(size: 48pt, weight: "bold", fill: white)[Break]

  #v(1em)
  #text(fill: white)[_We'll continue with the practical exercise_]
]

// ============================================================================
// SECTION: PRACTICAL EXERCISE
// ============================================================================
= Practical Exercise

== Today's Exercise

#slide[
  #v(0.5em)
  #align(center)[
    #image("files/presentation/exercise-steps.png", height: 45%)
  ]

  #v(1em)

  #grid(
    columns: 4,
    gutter: 1.2em,
    [
      #rect(fill: rgb("#E3F2FD"), radius: 4pt, inset: 0.8em)[
        #align(center)[*1. Read*]

        Study the exercise documentation
      ]
    ],
    [
      #rect(fill: rgb("#E8F5E9"), radius: 4pt, inset: 0.8em)[
        #align(center)[*2. Setup*]

        Configure BAS or VS Code
      ]
    ],
    [
      #rect(fill: rgb("#FFF3E0"), radius: 4pt, inset: 0.8em)[
        #align(center)[*3. Develop*]

        Build your CAP app
      ]
    ],
    [
      #rect(fill: rgb("#F3E5F5"), radius: 4pt, inset: 0.8em)[
        #align(center)[*4. Deploy*]

        Test and deploy to CF
      ]
    ],
  )
]

== Download the Exercise

#focus-slide(background-color: rgb("#0070F2"))[
  #text(size: 28pt, weight: "bold", fill: white)[Download the exercise from:]

  #v(1.5em)

  #text(size: 44pt, fill: white)[#link("https://tinyurl.com/saptum")[tinyurl.com/saptum]]
]

// ============================================================================
// SECTION: SUMMARY
// ============================================================================
= Summary

== Summary - BTP & CAP

#slide[
  #v(0.5em)
  *BTP* - SAP's platform providing a unified environment for:
  - Application development
  - Process automation
  - AI capabilities
  - Extension of SAP and non-SAP applications

  #v(1em)

  *CAP* - Go-to framework for pro-code applications on BTP with enterprise & cloud qualities:

  - *CDS:* Domain-specific, declarative modelling language
  - *CQN:* Structured query notation independent of SQL syntax
  - *Service-centric & Event-driven:* Guiding principle for exposing data
  - *OData:* Open protocol for RESTful APIs - automatically exposed by CAP
  - *Handlers:* Custom logic implementation reacting to service events
]

== Summary - Fiori Elements

#slide[
  #v(0.5em)
  *Fiori Elements* - Low-code framework for generating standardized SAP Fiori UIs

  #v(1.5em)

  #grid(
    columns: 2,
    gutter: 4em,
    [
      *Key Concepts:*
      - OData services as data source
      - CDS annotations for UI configuration
      - Standard floorplans for common patterns
      - Building blocks for flexibility
      - Enterprise features out-of-the-box
    ],
    [
      *Benefits:*
      - Faster development
      - UX consistency
      - Enterprise readiness
      - Lower maintenance
      - SAP design compliance
    ],
  )
]

== Interested? Join as a STAR Student!

#focus-slide(background-color: rgb("#0070F2"))[
  #text(size: 28pt, weight: "bold", fill: white)[We sparked your interest?]

  #v(1em)

  #text(size: 44pt, fill: white)[Join us as a STAR Student!]

  #v(1.5em)

  #text(fill: white)[Contact us for more information]
]

// ============================================================================
// THANK YOU
// ============================================================================
== Thank You

#slide[
  #v(2em)
  #align(center)[
    #text(size: 48pt, weight: "bold")[Thank you.]

    #v(2em)

    *Maximilian Eckert* - maximilian.eckert\@sap.com

    #v(0.5em)

    *Simon Kobler* - simon.kobler\@sap.com

    #v(0.5em)

    *Marten Schiwek* - marten.schiwek\@sap.com
  ]
]

== Solution Repository

#slide[
  #v(2em)
  #align(center)[
    #text(size: 24pt, weight: "bold")[Solution Repository]

    #v(2em)

    #text(size: 20pt)[
      #link("https://github.com/schiwekM/cap-uni-sample/tree/solution")[
        github.com/schiwekM/cap-uni-sample/tree/solution
      ]
    ]
  ]
]
