//
// TableExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct TableExamples: StaticLayout {
    var title = "Tables"

    var body: some HTML {
        Text("Tables")
            .font(.title1)

        Text("Tables let you create tabulate data in rows and columns for easier reading.")
            .font(.lead)

        Text("Simple tables consist of rows and columns, like this:")

        CodeBlock(.swift) {
            """
            Table {
                Row {
                    "Taylor Swift"
                    "555, Swiftie Avenue"
                    "Nashville"
                    "Tennessee"
                }

                Row {
                    "Adele Adkins"
                    "Caesars Palace"
                    "Las Vegas"
                    "Nevada"
                }

                Row {
                    "Tim Cook"
                    "Apple Park"
                    "Cupertino"
                    "California"
                }
            }
            """
        }

        Table {
            Row {
                "Taylor Swift"
                "555, Swiftie Avenue"
                "Nashville"
                "Tennessee"
            }

            Row {
                "Adele Adkins"
                "Caesars Palace"
                "Las Vegas"
                "Nevada"
            }

            Row {
                "Tim Cook"
                "Apple Park"
                "Cupertino"
                "California"
            }
        }
        .margin(.bottom, .xLarge)

        Text("You can also add headings to clarify what each column means:")

        CodeBlock(.swift) {
            """
            Table {
                Row {
                    "Taylor Swift"
                    "555, Swiftie Avenue"
                    "Nashville"
                    "Tennessee"
                }

                Row {
                    "Adele Adkins"
                    "Caesars Palace"
                    "Las Vegas"
                    "Nevada"
                }

                Row {
                    "Tim Cook"
                    "Apple Park"
                    "Cupertino"
                    "California"
                }
            } header: {
                "Name"
                "Address"
                "City"
                "State"
            }
            """
        }

        Table {
            Row {
                "Taylor Swift"
                "555, Swiftie Avenue"
                "Nashville"
                "Tennessee"
            }

            Row {
                "Adele Adkins"
                "Caesars Palace"
                "Las Vegas"
                "Nevada"
            }

            Row {
                "Tim Cook"
                "Apple Park"
                "Cupertino"
                "California"
            }
        } header: {
            "Name"
            "Address"
            "City"
            "State"
        }
        .margin(.bottom, .xLarge)

        Text("Table styling")
            .font(.title2)

        Text(markdown: "To make rows easier to distinguish, use `.tableStyle(.stripedRows)` to create a zebra striping effect:")

        CodeBlock(.swift) {
            """
            Table {
                Row {
                    "Bob Blob"
                    "Underwater Baker"
                    "Seaweed Scones"
                    "Collecting Rubber Ducks"
                }

                Row {
                    "Sally Sizzle"
                    "Firefighter Chef"
                    "Spicy Ice Cream"
                    "Volcano Surfing"
                }

                Row {
                    "Greg Grumble"
                    "Grumpy Florist"
                    "Thorny Roses Salad"
                    "Whispering to Snails"
                }
            } header: {
                "Name"
                "Occupation"
                "Favourite Food"
                "Secret Hobby"
            }
            .tableStyle(.stripedRows)
            """
        }

        Table {
            Row {
                "Bob Blob"
                "Underwater Baker"
                "Seaweed Scones"
                "Collecting Rubber Ducks"
            }

            Row {
                "Sally Sizzle"
                "Firefighter Chef"
                "Spicy Ice Cream"
                "Volcano Surfing"
            }

            Row {
                "Greg Grumble"
                "Grumpy Florist"
                "Thorny Roses Salad"
                "Whispering to Snails"
            }
        } header: {
            "Name"
            "Occupation"
            "Favourite Food"
            "Secret Hobby"
        }
        .tableStyle(.stripedRows)
        .margin(.bottom, .xLarge)

        Text(markdown: "Alternatively, use `.tableStyle(.stripedColumns)` to create columnar stripes:")

        CodeBlock(.swift) {
            """
            Table {
                Row {
                    "Bob Blob"
                    "Underwater Baker"
                    "Seaweed Scones"
                    "Collecting Rubber Ducks"
                }

                Row {
                    "Sally Sizzle"
                    "Firefighter Chef"
                    "Spicy Ice Cream"
                    "Volcano Surfing"
                }

                Row {
                    "Greg Grumble"
                    "Grumpy Florist"
                    "Thorny Roses Salad"
                    "Whispering to Snails"
                }
            } header: {
                "Name"
                "Occupation"
                "Favourite Food"
                "Secret Hobby"
            }
            .tableStyle(.stripedColumns)
            """
        }

        Table {
            Row {
                "Bob Blob"
                "Underwater Baker"
                "Seaweed Scones"
                "Collecting Rubber Ducks"
            }

            Row {
                "Sally Sizzle"
                "Firefighter Chef"
                "Spicy Ice Cream"
                "Volcano Surfing"
            }

            Row {
                "Greg Grumble"
                "Grumpy Florist"
                "Thorny Roses Salad"
                "Whispering to Snails"
            }
        } header: {
            "Name"
            "Occupation"
            "Favourite Food"
            "Secret Hobby"
        }
        .tableStyle(.stripedColumns)
        .margin(.bottom, .xLarge)

        Text("Row and column formatting")
            .font(.title2)

        Text(markdown: """
        Rows are top-aligned by default, but you can change that by adding a `Column` then using its `verticalAlignment()` modifier.
        This is easier to see when the table borders is enabled using the `tableBorder()` modifier, like this:
        """
        )

        CodeBlock(.swift) {
            """
            Table {
                Row {
                    Column {
                        "Top"
                    }
                    .verticalAlignment(.top)

                    Column {
                        "Middle"
                    }
                    .verticalAlignment(.middle)

                    Column {
                        "Bottom"
                    }
                    .verticalAlignment(.bottom)

                    Column {
                        \"""
                        This is much longer text and will wrap over multiple lines, so we can see vertical alignment working. \
                        This is much longer text and will wrap over multiple lines, so we can see vertical alignment working. \
                        This is much longer text and will wrap over multiple lines, so we can see vertical alignment working. \
                        This is much longer text and will wrap over multiple lines, so we can see vertical alignment working. \
                        This is much longer text and will wrap over multiple lines, so we can see vertical alignment working.
                        \"""
                    }
                }
            }
            .tableBorder(true)
            """
        }

        Table {
            Row {
                Column {
                    "Top"
                }
                .verticalAlignment(.top)

                Column {
                    "Middle"
                }
                .verticalAlignment(.middle)

                Column {
                    "Bottom"
                }
                .verticalAlignment(.bottom)

                Column {
                    """
                    This is much longer text and will wrap over multiple lines, so we can see vertical alignment working. \
                    This is much longer text and will wrap over multiple lines, so we can see vertical alignment working. \
                    This is much longer text and will wrap over multiple lines, so we can see vertical alignment working. \
                    This is much longer text and will wrap over multiple lines, so we can see vertical alignment working. \
                    This is much longer text and will wrap over multiple lines, so we can see vertical alignment working.
                    """
                }
            }
        }
        .tableBorder(true)
        .margin(.bottom, .xLarge)

        Text(markdown: "Each row item occupies one column by default, but `Column` objects have a `columnSpan()` modifier to adjust that:")

        CodeBlock(.swift) {
            """
            Table {
                Row {
                    "This is a column"
                    "Another column"
                    "One more for luck"
                }

                Row {
                    Column {
                        "This column is as wide as the previous three, and is aligned to the center."
                    }
                    .columnSpan(3)
                    .horizontalAlignment(.center)
                }

                Row {
                    "This is another column"

                    Column {
                        "This column occupies two slots, and is aligned to the trailing edge."
                    }
                    .columnSpan(2)
                    .horizontalAlignment(.trailing)
                }
            }
            .tableBorder(true)
            """
        }

        Table {
            Row {
                "This is a column"
                "Another column"
                "One more for luck"
            }

            Row {
                Column {
                    "This column is as wide as the previous three, and is aligned to the center."
                }
                .columnSpan(3)
                .horizontalAlignment(.center)
            }

            Row {
                "This is another column"

                Column {
                    "This column occupies two slots, and is aligned to the trailing edge."
                }
                .columnSpan(2)
                .horizontalAlignment(.trailing)
            }
        }
        .tableBorder(true)
    }
}
