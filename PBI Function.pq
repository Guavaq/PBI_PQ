let
    Source = (RunID as text, #"Park Run Name" as text) => let
        Source = Web.Page(Web.Contents("http://www.parkrun.org.uk/" & #"Park Run Name" & "/results/weeklyresults/?runSeqNumber=" & RunID)),
        Data0 = Source{0}[Data],
        #"Changed Type" = Table.TransformColumnTypes(Data0,{{"Pos", Int64.Type}, {"parkrunner", type text}, {"Time", type text}, {"Age Cat", type text}, {"Age Grade", Percentage.Type}, {"", type text}, {"Gender Pos", Int64.Type}, {"Club", type text}, {"Note", type text}, {"Total Runs", Int64.Type}, {"Total Runs2", type text}})
    in
        #"Changed Type"
in
    Source