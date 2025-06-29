let
    // Current year +/- 50
    CurrentYear = Date.Year(DateTime.LocalNow()),
    Years = List.Numbers(CurrentYear - 50, 101),

    // To table
    YearTable = Table.FromList(Years, Splitter.SplitByNothing(), {"Year"}),

    // Calculate Easter Sunday
    AddEaster = Table.AddColumn(YearTable, "EasterSunday", each 
        let
            Y = [Year],
            a = Number.Mod(Y, 19),
            b = Number.IntegerDivide(Y, 100),
            c = Number.Mod(Y, 100),
            d = Number.IntegerDivide(b, 4),
            e = Number.Mod(b, 4),
            f = Number.IntegerDivide(b + 8, 25),
            g = Number.IntegerDivide(b - f + 1, 3),
            h = Number.Mod(19 * a + b - d - g + 15, 30),
            i = Number.IntegerDivide(c, 4),
            k = Number.Mod(c, 4),
            l = Number.Mod(32 + 2 * e + 2 * i - h - k, 7),
            m = Number.IntegerDivide(a + 11 * h + 22 * l, 451),
            month = Number.IntegerDivide(h + l - 7 * m + 114, 31),
            day = Number.Mod(h + l - 7 * m + 114, 31) + 1
        in
            #date(Y, month, day)
    ),

    // Table with national holidays (with exceptions for Koningsdag and Bevrijdingsdag))
    AddFeestdagen = Table.AddColumn(AddEaster, "Feestdagen", each
        let
            Y = [Year],
            Pasen = [EasterSunday],
            FeestdagLijst = {
                [Naam = "Nieuwjaarsdag", Datum = #date(Y, 1, 1)],
                [Naam = "1e Paasdag", Datum = Pasen],
                [Naam = "2e Paasdag", Datum = Date.AddDays(Pasen, 1)],
                [Naam = "Koningsdag", Datum = if Date.DayOfWeek(#date(Y, 4, 27), Day.Sunday) = 0 then #date(Y, 4, 26) else #date(Y, 4, 27)],
                if Number.Mod(Y, 5) = 0 then [Naam = "Bevrijdingsdag", Datum = #date(Y, 5, 5)] else null,
                [Naam = "Hemelvaartsdag", Datum = Date.AddDays(Pasen, 39)],
                [Naam = "1e Pinksterdag", Datum = Date.AddDays(Pasen, 49)],
                [Naam = "2e Pinksterdag", Datum = Date.AddDays(Pasen, 50)],
                [Naam = "1e Kerstdag", Datum = #date(Y, 12, 25)],
                [Naam = "2e Kerstdag", Datum = #date(Y, 12, 26)]
            },
            FeestdagLijstFiltered = List.RemoveNulls(FeestdagLijst)
        in
            FeestdagLijstFiltered
    ),

    // Expand table
    ExpandFeestdagen = Table.ExpandListColumn(AddFeestdagen, "Feestdagen"),
    ExpandRecords = Table.ExpandRecordColumn(ExpandFeestdagen, "Feestdagen", {"Naam", "Datum"}),

    // Optional column to make merging with other tables easier
    AddIsFeestdag = Table.AddColumn(ExpandRecords, "IsFeestdag", each true, type logical),

    // Select and sort columns
    Result = Table.SelectColumns(AddIsFeestdag, {"Datum", "Naam", "IsFeestdag"}),
    Sorted = Table.Sort(Result, {{"Datum", Order.Ascending}})
in
    Sorted