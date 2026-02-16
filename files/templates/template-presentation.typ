// Shared template for CAP Workshop presentations using Touying
// This file contains theme configuration, styling, and helper functions

#import "@preview/touying:0.6.1": *
#import themes.university: *

// =============================================================================
// CONSTANTS
// =============================================================================
#let cap-logo-path = "../cap-logo.svg"
#let section-background-path = "../presentation/initial-background.png"

// =============================================================================
// CUSTOM SECTION SLIDE WITH BACKGROUND IMAGE
// =============================================================================
// Section slide font color (configurable)
#let section-slide-text-color = state("section-slide-text-color", black)

#let section-slide-with-background(config: (:), level: 1, numbered: true, body) = touying-slide-wrapper(self => {
  let self = utils.merge-dicts(
    self,
    config,
    config-page(
      margin: 0em,
      background: {
        set image(fit: "cover", width: 100%, height: 100%)
        image(section-background-path)
      },
    ),
  )
  let slide-body = {
    set align(horizon)
    show: pad.with(20%)
    context {
      let text-color = section-slide-text-color.get()
      set text(size: 1.5em, fill: text-color, weight: "bold")
      stack(
        dir: ttb,
        spacing: .65em,
        utils.display-current-heading(level: level, numbered: numbered),
        block(
          height: 2pt,
          width: 100%,
          spacing: 0pt,
          components.progress-bar(height: 2pt, text-color, text-color.lighten(50%)),
        ),
      )
      body
    }
  }
  touying-slide(self: self, config: config, slide-body)
})

// =============================================================================
// PRESENTATION SETUP FUNCTION
// =============================================================================
// Call this with: #show: presentation-setup.with(...)
#let presentation-setup(
  title: [Presentation Title],
  subtitle: [],
  author: [],
  date: datetime.today(),
  institution: [SAP],
  section-text-color: black,
  doc,
) = {
  // Set section slide text color
  section-slide-text-color.update(section-text-color)
  // Register CDS syntax highlighting from sublime-syntax file
  set raw(syntaxes: "../syntax/cds.sublime-syntax")

  // Apply Touying university theme with SAP branding
  show: university-theme.with(
    aspect-ratio: "16-9",
    config-info(
      title: title,
      subtitle: subtitle,
      author: author,
      date: date,
      institution: institution,
      logo: image(cap-logo-path, height: 1.8em),
    ),
    config-colors(
      primary: rgb("#0070F2"), // SAP Blue
      secondary: rgb("#1B4F72"), // Dark Blue
      tertiary: rgb("#6C757D"), // Gray
    ),
    config-common(
      // Use custom section slide with background image
      new-section-slide-fn: section-slide-with-background,
    ),
    // Remove footer completely
    footer-columns: (0%, 0%, 0%),
    footer-a: self => [],
    footer-b: self => [],
    footer-c: self => [],
    // Header: title on left with padding, logo on right with padding
    header: self => {
      set text(size: 23pt, weight: "bold", fill: self.colors.primary)
      pad(left: 0.5em, top: 0.8em)[
        #utils.display-current-heading(level: 2)
      ]
    },
    header-right: self => pad(right: 1.5em, top: 0.8em)[
      #self.info.logo
    ],
    progress-bar: true,
  )

  // Page margins
  set page(margin: (x: 2.5em, top: 5em, bottom: 2em))

  // Typography - SAP 72 fonts with fallbacks
  // Note: When compiling, use: typst compile --font-path files/fonts/ your-file.typ
  set text(font: "72", size: 18pt)
  show link: underline

  // Code block styling - inline
  show raw.where(block: false): box.with(
    fill: rgb("#f0f0f0"),
    inset: (x: 4pt, y: 2pt),
    outset: (y: 2pt),
    radius: 2pt,
  )

  // Code block styling - block with dark theme
  show raw.where(block: true): block.with(
    fill: rgb("#1e1e1e"),
    inset: 14pt,
    radius: 6pt,
    width: 100%,
  )
  show raw: set text(font: "72", size: 12pt)
  show raw.where(block: true): set text(fill: rgb("#d4d4d4"))

  doc
}

// =============================================================================
// HELPER FUNCTIONS
// =============================================================================

// Styled link with blue color
#let link-blue(url, label) = text(fill: blue)[#link(url)[#label]]

// Colored info box
#let info-box(content, fill-color: rgb("#E3F2FD")) = rect(
  fill: fill-color,
  radius: 4pt,
  inset: 1em,
  content,
)

// Centered info box
#let centered-info-box(content, fill-color: rgb("#E3F2FD")) = align(center)[
  #rect(
    fill: fill-color,
    radius: 4pt,
    inset: 1em,
    content,
  )
]

// Pillar box for architecture diagrams
#let pillar-box(title, items, fill-color: rgb("#E3F2FD")) = rect(
  fill: fill-color,
  radius: 4pt,
  width: 100%,
  inset: 1em,
)[
  #align(center)[*#title*]
  #v(0.5em)
  #set text(size: 13pt)
  #items
]

// Feature box with fixed height (for comparison grids)
#let feature-box(title, description, fill-color: rgb("#E8F5E9"), height: 10em) = rect(
  fill: fill-color,
  radius: 4pt,
  inset: 1em,
  height: height,
)[
  #align(center)[*#title*]
  #v(0.5em)
  #description
]

// Step box for process flows
#let step-box(number, title, description, fill-color: rgb("#E3F2FD")) = rect(
  fill: fill-color,
  radius: 4pt,
  inset: 0.8em,
)[
  #align(center)[*#number. #title*]
  #description
]
