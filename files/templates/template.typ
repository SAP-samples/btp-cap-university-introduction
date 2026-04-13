// Shared template for CAP Workshop documents

// Document setup function - call this at the start of each document with #show: workshop-setup
#let workshop-setup(doc) = {
  set text(font: "72")
  set heading(numbering: "1.")
  set par(leading: 0.75em, spacing: 1.5em)
  set raw(syntaxes: "../syntax/cds.sublime-syntax")
  
  // Page setup with numbering and footer logo
  set page(
    footer: context {
      let page-num = counter(page).display("1")
      grid(
        columns: (auto, 1fr, auto),
        align: (left, center, right),
        [#image("../sap-btp-logo.svg", height: 20pt)],
        [#page-num],
        []
      )
    }
  )
  
  // Heading styling
  show heading: it => [
    #v(1.2em)
    #it
    #v(0.8em)
  ]
  
  // Code block styling with background
  show raw.where(block: true): it => block(
    fill: luma(245),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    it
  )
  
  doc
}

// Helper for styled links (blue color)
#let link-blue(url, label) = text(fill: blue)[#link(url)[#label]]

// Helper for hint/note blocks
#let hint-block(content) = block(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
  content
)

// Image placeholder helper
#let placeholder(label, width: 70%, height: 100pt) = align(center)[
  #rect(width: width, height: height, stroke: 1pt + gray)[
    #align(center + horizon)[
      #text(fill: gray)[#emph(label)]
    ]
  ]
]
