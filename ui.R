# Library needed to create shiny app
library(shiny)
library(shinythemes)
library(plotly)

# Creates the shiny UI for my app
shinyUI(
  navbarPage(
    theme = shinytheme("slate"),
    "Sharks",
    # Creats Tab Panel for Mission tab
     tabPanel(
      "Mission",

      # Adds CSS styling to Shiny App
      includeCSS("style.css"),

      # Creates Title for Mission Panel
      titlePanel(tags$h1(class = "mapTitle", "Our Mission")),
      tags$style(type = "text/css", "a{color: #5BC1DB;}"),

      # Creates page for information on our app"
      fluidPage(
        tags$div(
          tags$br(),
          tags$img(src = "shark1.jpg", height = 300, width = 500,
                   class = "center"),
          tags$h4(class = "MissionInfo", "Through the use of the Shark Research
                  Insitute's dataset, we have created multiple tab panels of
                  data visualizations of all recorded shark attacks.  These
                  interactive visualizations will give you the oppurtunity to
                  explore different areas of the data set and hopefully provide
                  you with some valuable insight on shark attacks. By the
                  end of our app, we hope you will be more informed on
                  where and how these shark attacks happen, learn about the
                  different species of sharks, and better understand the
                  complexity of these different incidents."),
          tags$br(),
          tags$h2(class = "mapTitle", "Information on the Data set"),
          tags$img(src = "oceanFloor.jpg", height = 200, width = 600,
                   class = "center"),
          tags$br(),
          tags$p(class = "Mission", "   The data used in our shiny app is from
                  the Global Shark Attack dataset collected by the Shark
                  Research Institute.  The Shark Research Institute is a
                  research organization founded in 1991 at Princeton, New
                  Jersey. It was created to sponsor and conduct research on
                  sharks ensuring and bringing awareness to their conservation.
                  This dataset aims to explore the significance of interactions
                  between sharks and humans in comparison to the wide variety
                  of dangers we are exposed to in our daily lives. Humans are
                  not a prey to sharks, this dataset aims to give a better
                  understanding of interactions between humans and sharks
                  to minimize the risk of being injured by a shark and focusing
                  on the importance of conserving all shark species. The
                  dataset’s objective is to illustrate the actual threat that
                  sharks present to humans, to convey the message that these
                  creatures are not at all aggressive towards humans but our
                  ignorance and belief in stereotypes have made us think
                  otherwise."),
          tags$br(),
          tags$p(class = "Mission", "Those who may be interested in using this
                 dataset would vary from medical personnel, shark behaviorists,
                 divers, lifesavers to the media and students. The media would
                 be a major target audience to focus on. Researchers who gather
                 this data conducted personal interviews with medical
                 personnel, victims and witnesses to obtain a first-hand
                 account of this incident. After forensic analysis is
                 conducted on the incident, it can then be reported
                 accurately through the media to answer the public's question
                 of whether the stereotype of sharks naturally attacking
                 humans is true or merely a misconception.
                 If proven a false stereotype, the media can inform the world
                 (their target audience) that sharks are not as dangerous as
                 the general population thinks."),
          tags$a(href = "http://www.sharkattackfile.net/",
                 "Shark Attack Website Reference Here!"),
          tags$br(),
          tags$h2(class = "mapTitle", "Tab Functions"),
          tags$img(src = "nemo.jpg", height = 300, width = 500,
                   class = "center"),
          tags$br(),
          tags$p(class = "tabsInfo", "Our App includes a 'Map' tab that
                 gives a summarized and organized visualization of
                 the data that aims to answer:"),
          tags$p(class = "tabsInfo",  "1.	Which parts of the world do
                 shark attacks occur?"),
          tags$p(class = "tabsInfo", "2. How did the incident occur?
                 Were the sharks provoked or not?"),
          tags$p(class = "tabsInfo", "3. In which years did certain
                 activites occur?"),
          tags$p(class = "tabsInfo", "4. Which species of sharks were
                 involved in attacks and in which areas?"),
          tags$p(class = "tabsInfo", "Within the 'Map' tab, you can find
                 the 'Summary' tab that explains in detail
                 some findings we have found our own."),
          tags$p(class = "tabsInfo",  "The 'Species' tab categorizes
                 the various shark species and the number of attacks
                 they were involved in. The sub tabs within gives a
                 detailed account of the time period the specific
                 shark species attacked and the attack type of the
                 incident."),
          tags$p(class = "tabsInfo",  "The 'Time of Shark Attacks Tab',
                 aims to find out when attacks usually occur at the
                 given time of the day. It explores the time at which
                 attack occurs for given activities, attack type,
                 decade period and shark species."),
          tags$p(class = "tabsInfo",
                 "The 'Month/Weekday Breakdown of Attacks' tab explores
                 which time of the day are shark attacks most frequent
                 given a specific month or day to look at, given a
                 time period. Furthermore, another sub tab explores the
                 deadliest months in the year or day in the week given
                 a certain time period."),
          tags$p(class = "tabsInfo",
                 "The 'Number of Shark Attacks' tab explores the total
                 number of attacks in a given year, month or day of the
                 month in specific. This tab analyzes a more detailed
                 time unit than the previous tab."),
          tags$h3(class = "mapTitle", "Conclusion"),
          tags$p(class = "tabsInfo",
                 "In conclusion, our app aims to answer many questions
                 that deal with the nature of shark attacks, where it
                 occurs and the frequency of the attacks. From these
                 data visualizations, we try to infer the reasons for
                 such attacks and how we can move forward to prevent
                 any form of such attacks or conflicts between humans
                 and these diverse shark species. We hope that your
                 exploring of our app will serve to be informative and
                 beneficial to your experience with sharks no matter
                 your profession or background.")
        )
      )
      # Tap Panel: Mission Page end
    ),

    # Creates Map panel
    tabPanel(
      "Interactive Map",

      # Creates Title for Map Panel
      titlePanel(tags$div(tags$h1(class = "mapTitle",
                                  "Map of Recorded Shark Attacks"))),

      # Creates sidepanel for different widgits
      sidebarLayout(
        sidebarPanel(
          tags$div(
            tags$h5(class = "context", "This map creates a data
                    visualization of the locations where shark
                    attacks occur around the world. Use the widgets
                    below to change the data displayed on the
                    map. In addition, hover over the points
                    for more detailed information and you can
                    even click on the legend to further specify
                    which data is to be displayed.")
          ),

          # Creates the select input to filter different points on the map
          selectInput(
            "filterclass",
            label = h3("Choose What to See!"),

            # Gives user option for the filter input panel
            choices = list(
                          "Attack Type" = "Type",
                          "Fatal" = "Fatal",
                          "Decade" = "Decade",
                          "Species" = "Species"
            ),
            width = "200px"
          ),
          tags$div(
            tags$h6(class = "selectFilter"),
            tags$p(),
            tags$h6(class = "selectFilter", "Decade:
                    grouped into different 10-year time periods"),
            tags$p(),
            tags$h6(class = "selectFilter", "Species:
                    grouped based on the species of the shark involved in
                    the incident"),
            tags$p(),
            tags$h6(class = "selectFilter", "Attack Type: grouped based on how
                    incident occured"),
            tags$p(),
            tags$h6(class = "selectFilter", "Fatal: grouped based on if there
                    were any deaths from incident")
          ),

          # Creates the slider function for the range of years
          sliderInput("range",
            label = h3("Vary the Years!"), min = 1800,
            max = 2017, value = c(1800, 2017),
            width = "300px"
          ),

          # Creates radio button to exclude certain information
          radioButtons("exclude",
            label = h3("Exclude Unknown Data?"),
            choices = list("Yes" = "TRUE", "No" = "FALSE")
          ),
          tags$div(
            tags$h6(class = "selectFilter", "By selecting yes, all points that
                    have data with unknown information will be removed from the
                    map."),
            tags$h6(class = "selectFilter", "For example, any shark species that
                    was not identified will not be shown.  By selecting no,
                    all points (exlcuding points that do not have a lon/lat
                    values), regardless of the data they contain, will be
                    plotted on the map.")
          ),
          tags$p(class = "disclaimer", "Points are rough estimations of
                 locations and not 100% accurate based on the nature of the
                 dataframe.  Not all recored shark attacks are plotted onto
                 the map")
        ),

        # Creates the panel for the map and summary information
        mainPanel(

          # Creates different tabs inside the map panel
          tabsetPanel(

            # Creates the panel for the interactive map
            tabPanel("Interactive map",
                     plotlyOutput("Map", width = "925px", height = "705px")),

            # Creates the panel for information gathered from the map
            tabPanel("Summary", tags$div(
              tags$h3(class = "sumI", "Some quick notes from the Map:"),
              tags$br(),
              tags$h4("1) Most aggressive sharks appear to be the
                      Tiger Shark, Great White Shark, and Bull Shark"),
              tags$h1(),
              tags$h4("2) The Great White Shark is the most 'global shark'
                      with the highest frequency of incidents"),
              tags$h1(),
              tags$h4("3) Most 'aggressive' areas: Australia coast,
                      Southeastern coast of United States (Florida),
                      Western Coast of the United States, Caribbean Islands,
                      Southern Europe, South Africa Coast"),
              tags$h1(),
              tags$h4("4) Most provoked attacks occur along the
                      Southeastern Coast of the United States"),
              tags$br(),
              tags$h3(class = "sumI", "This information also provides insight
                      on the 'regional' sharks."),
              tags$h4(class = "different", "Note: region-exlusive represents a
                      species that only appeared in that particular region"),
              tags$br(),
              tags$h4("Australia: Bronze Whaler Shark (region-exclusive),
                      Bull Shark, Carpet Shark (region-exclusive),
                      Grey Nurse Shark (region-exclusive),
                      Wobbegong Shark (region-exclusive), Great White Shark"),
              tags$h1(),
              tags$h4("Caribbean Islands: Caribbean Reef Shark
                      (region-exclusive)"),
              tags$h1(),
              tags$h4("Europe: Blue Shark, Porbeagle Shark (Atlantic),
                      Great White Shark"),
              tags$h1(),
              tags$h4("South Africa: Copper Shark (region-exclusive),
                      Zambezi Shark (Name for Bull Shark in Africa),
                      Raggedtooth Shark (region-exclusive), Great White Shark"),
              tags$h1(),
              tags$h4("Southeastern USA: Blacktip Shark (Florida),
                      Bull Shark (Florida),
                      Tiger Shark, Lemon Shark,
                      Nurse Shark (region-exclusive), Sand Shark"),
              tags$h1(),
              tags$h4("West Coast USA: Great White Shark (Pacific Ocean)")
            ))
          )
        )
      )

      # Tap Panel: Map end
    ),

    # Creates tab Panel for Species section
    tabPanel(
      "Breakdown of Shark Species",

      # Creates Title for Species panel
      titlePanel(tags$div(tags$h1(class = "mapTitle",
                                  "Breakdown of Sharks Attacks By Species"))),
      sidebarLayout(

        # Creates side panel for pick the species option
        sidebarPanel(

          # Creates radio buttons for user to pick a species
          radioButtons("PickSpecies",
            label = h3(class = "sharkTypes", "Pick a Shark Species!"),
            choices = list(
                    "Great White Shark (605 total attacks)" =
                    "Great White Shark",
                    "Tiger Shark (234 total attacks)" = "Tiger Shark",
                    "Bull Shark (152 total attacks)" = "Bull Shark",
                    "Blacktip Shark (64 total attacks)" = "Blacktip Shark",
                    "Bronze Whaler Shark (60 total attacks)" =
                    "Bronze Whaler Shark",
                    "Mako Shark (51 total attacks)" = "Mako Shark",
                    "Nurse Shark (49 total attacks)" = "Nurse Shark",
                    "Wobbegong Shark (45 total attacks)" = "Wobbegong Shark",
                    "Hammerhead Shark (43 total attacks)" = "Hammerhead Shark",
                    "Raggedtooth Shark (43 total attacks)" =
                    "Raggedtooth Shark",
                    "Unknown Shark" = "Unknown Species"
                   )
          )

        ),

        # Uses tabset panel to create four different tabs of information
        mainPanel(
          tabsetPanel(
            # Creates tab panel for shark types with pictures
            tabPanel("Types of Sharks",
                       tags$h3("Here are the different types of sharks with
                               over 40 recorded attacks:",
                               class = "sharkTypes"),
                       tags$img(src = "sharkslayout.jpg", height = 900,
                                width = 1500, class = "left")
                     ),

            # Creates the tab panel for the first graph
            tabPanel("Attacks by Decade (Fatal)",
                     plotlyOutput("species_graph_1",
                                  width = "800px", height = "600px")),

            # Creates the tab panel for the second graph
            tabPanel("Attacks by Decade (Attack Type)",
                     plotlyOutput("species_graph_2",
                                  width = "800px", height = "600px")),

            # Creates the tab panel for the third graph
            tabPanel("Attacks by Attack Type (Fatal)",
                     plotlyOutput("species_graph_3",
                                  width = "800px", height = "600px")),

            # Creates the tab panel for the summmary information
            tabPanel(
              "Summary",
              tags$div(
                tags$h3(class = "sharkTypes", "Here are some quick notes
                        on the information gathered
                        from the different graphs:"),
                tags$br(),
                tags$h4("- Of the 10 shark species with the most attacks,
                        only the Great White Shark, Tiger Shark, Bull Shark,
                        and Mako shark have had a fatal incident in the
                        last 30 years"),
                tags$br(),
                tags$h4("- Despite being involved in only 49 incidents,
                        the Nurse Shark has been provoked in 33 of those
                        incidents"),
                tags$br(),
                tags$h4("- Unprovoked attacks are the most common reason for
                        shark attacks, possibly because of increased human
                        acitivty over the years"),
                tags$br(),
                tags$h4("- The amount of unknown species attacks had a
                        large spike in 1960s along with the highest amount of
                        provoked attacks over any decade.  This total wouldn't
                        be eclipsed until the 2000s"),
                tags$br(),
                tags$h4("- The amount of shark attacks have been steadily
                        increasing with most of the attacks coming
                        from the last 17 years. This is probably attributed
                        to how data collection has become more advanced and
                        increase in human activity in these areas")
              )
            )
          )
        )
      )

    # Tap Panel: Species end
    ),

    # Tab Panel for Shark Attacks
    tabPanel(
      "Time of Shark Attacks",

      # Creates Title
      titlePanel(tags$div(tags$h1(class = "mapTitle",
                                  "Time of Shark Attacks"))),

      #titlePanel(class = "mapTitle", "Time of Shark Attacks"),

      # Creates layout for time panel
      sidebarLayout(

        #Creates the sidebar panel
        sidebarPanel(

          # Creates select widgit for x axis on graph
          selectInput(
            "filterTime",
            label = h3(class = "tabFive", "Select X Variable"),

            # Gives user option for the filter input panel
            choices = list(
              "Activity" = "Activity",
              "Attack Type" = "Type",
              "Decade" = "Decade",
              "Species" = "Species"
            ),
            width = "200px"
          ),
          tags$div(
            tags$h5(class = "context", "
                    In this tab, we have a box plot graph which we can select
                    our preferred horizontal axis variable and see which time
                    of the day were the attacks most prominent on,
                    based on that variable category.
                    We have grouped the dataset into four categories:"),
            tags$br(),
            tags$h4(class = "contextTitle", "ACTIVITY"),
            tags$h5(class = "context", "
                    The data is grouped based on which
                    popular water activity the victims was doing
                    when the attack occurred. The graph then displays
                    which time of day were the attacks during
                    each activity most prominent."),
            tags$br(),
            tags$h4(class = "contextTitle", "ATTACK TYPE"),
            tags$h5(class = "context", "The data is grouped based
                    on whether the attacks came from sharks that were provoked
                    or unprovoked, or caused by boating. The graph then
                    displays on which time of day were the attacks most
                    prominent based on each attack type."),
            tags$br(),
            tags$h4(class = "contextTitle", "DECADE"),
            tags$h5(class = "context", "The data is grouped based on attacks
                    within 10-year periods from 1880 to 2017. The graph
                    then displays which time of day were the shark attacks most
                    prominent in each decade. As with other time-period graphs,
                    a general trend is visible with the time of day for the
                    shark attacks narrowing down to mostly during daytime!"),
            tags$br(),
            tags$h4(class = "contextTitle", "SPECIES"),
            tags$h5(class = "context", "The data is grouped based on the
                    types of sharks that made the recorded attacks. The graph
                    then displays on which time of the day do each species
                    of shark mostly attacked on. ")
          )
        ),
        mainPanel(
          plotOutput("time_graph",
                       width = "800px", height = "600px")
          )
        )

      # Time Shark Attacks Panel End
      ),

      # Tap Panel Time/Total of Attacks vs Month/Weekday
      tabPanel(
        "Month/Weekday Breakdown of Attacks ",

        # Creates Title for Panel
        titlePanel(
          tags$div(
            tags$h1(class = "mapTitle",
                                    "Month and Weekday Occurences of Attacks"
                    )
            )
          ),

        # Creates layout for month/weekday panel
        sidebarLayout(

          #Creates the sidebar panel
          sidebarPanel(

            # Creates select widgit for x axis on graph
            selectInput(
              "Xaxis",
              label = h3(class = "tabFive", "Month or Weekday?"),

              # Gives user option for the filter input panel
              choices = list(
                "Month" = "Month",
                "Weekday" = "Weekday"
              ),
              width = "200px"
            ),

            # Creates slider widgit for user to pick time period
            sliderInput("time",
                        label = h3(class = "tabFive", "Vary the Years!"),
                        min = 1900,
                        max = 2017, value = c(1900, 2017),
                        width = "300px"
            ),
            tags$h3(class = "tabFive", "Findings on Month/Weekday vs Time"),
            tags$h5(class = "context",
                    "Based on the data we used, attacks usually occur
                    in the late mornings to early afternoons from 11:00 AM to
                    3:30 PM. This is probably contributed to the
                    fact that most human activity or water sports occur at this
                    time. More specifically, these attacks occur in the
                    afternoon at around 2:00 PM. With higher frequency of
                    activities, comes a higher probability of any form of
                    provocation or attacks."),
            tags$h5(class = "context",
                    "Reading the graph this finding is rather consistent
                    whether month or day. Even by changing the range of
                    years, the results are still consistent that attacks
                    occur at that timing. However, the results become more
                    inconsistent as we go further back in time. This could
                    be due to the less comprehensive data collection methods
                    in the past. Thus, we will study the data using the whole
                    range of time period. Moving forward from here, a possible
                    recommendation is to not have too much activity at
                    that time to induce less shark attacks as the high
                    volume of visits to these areas may have been seen
                    as a form of provocation by the sharks."),
            tags$br(),
            tags$h3(class = "tabFive", "Findings on Month/Weekday vs Total"),
            tags$h5(class = "context",
                    "Measuring time periods against the total attacks,
                    focusing on months, we found that the period from
                    June to September proved to be the deadliest months.
                    This is with the time frame from 1900 to the present
                    year (2017). If we varied the range, it seemed to be random,
                    thus by studying the entire time range, we gained
                    a more consistent, credible and comprehensive result.
                    With June to September as the deadliest months, this
                    seemed to make sense as summer season
                    (in the Northern Hemisphere)
                    encourages more people to engage in water activites."),
            tags$h5(class = "context",
                    "The spike of total attacks in January can be explained by
                    the summer season of the Southern Hemisphere, with popular
                    sites: Australia and South Africa home to many shark
                    attacks. The higher frequency correlates to more
                    occurences of attacks.
                    Focusing on the weekday, with a time range of the
                    entire time period from 1900 to present, it
                    shows that Saturday and Sunday are the deadliest
                    days. This also makes sense because weekends usually
                    are when most people are enageged in recreational
                    activities. Even as we vary the time range, these
                    results remain rather consistent.")
          ),
          # Creates main panel with graphs
          mainPanel(
            tabsetPanel(

              # Tab Panel with Month/Weekday vs Time BoxPlot
              tabPanel("Month/Weekday vs Time",
                       plotOutput("month_weekday_times",
                                  width = "800px", height = "600px")),

              # Tab Panel for Month/Weekday vs Total Graph
              tabPanel("Month/Weekday vs Total",
                       plotOutput("month_weekday_totals",
                                  width = "800px", height = "600px"))
            )

          )
        )


      # Tab Bar end: Month/Weekday
      ),
    # Tab Panel for number of attacks among year/month/day
    tabPanel(
      "Numbers of Shark Attacks",

      # Creates Title
      titlePanel(tags$div(tags$h1(class = "mapTitle",
                                  "Number of Shark Attacks"))),

      # Creates layout for this panel
      sidebarLayout(

        # Creates the sidebar panel
        sidebarPanel(

          # Creates select decades
          selectInput(
            "decade ",
            label = h3(class = "tabSix", "Select a Decade Period to Explore!"),

            # Gives user option for the filter input panel
            choices = list(
              "2010-2017" = "2010-2017",
              "2000-2009" = "2000-2009",
              "1990-1999" = "1990-1999",
              "1980-1989" = "1980-1989",
              "1970-1979" = "1970-1979",
              "1970-1979" = "1970-1979",
              "1960-1969" = "1960-1969",
              "1950-1959" = "1950-1959",
              "1940-1949" = "1940-1949",
              "1930-1939" = "1930-1939",
              "1920-1929" = "1920-1929",
              "1910-1919" = "1910-1919",
              "1900-1909" = "1900-1909",
              "1890-1899" = "1890-1899",
              "1880-1889" = "1880-1889"
            ),
            width = "200px"
          ),

          # Gives user to filter by Year/Month/Day
          selectInput(
            "time ",
            label = h3(class = "tabSix",
                       "Number of attacks against which time frame?"),

            # Gives user option
            choices = list(
              "Years" = "Year",
              "Months" = "Month",
              "Days" = "Day"

            ),
            width = "200px"
          ),
          tags$br(),
          tags$h3(class = "tabSix", "Description"),
          tags$h5(class = "context",
                  "With this interactive bar chart, you can explore the
                  dataset within different time periods. In the specific
                  decade you choose, the graph displays numbers of shark
                  attacks against different time periods. For instance,
                  if you want to learn about the month with the highest
                  frequency of attacks and the month with less frequency of
                  attacks between 2010-2017. You can do this in two simple
                  steps:"),
          tags$h5(class = "context", "1. Set the decade to 2010-2017"),
          tags$h5(class = "context", "2. Set the unit, time period, as month."),
          tags$h5(class = "context", "That's it! Feel free to explore!")
        ),
        mainPanel(
          plotOutput("bar_chart",
                     width = "800px", height = "600px"
          )
        )
      )
    )
    # Tab Panel of numbers of attacks end

  # NavBar end
  )

# Shiny UI end
)
