function DisplayRevisionInfos()
{
    var strCurrentDirectory = window.location.href;
    var strTemp             = strCurrentDirectory.toLowerCase();

    // Get current directory
    {
        // Script was started from a simple .html file
        if (strTemp.substring(0, 8) == "file:///")
        {
            strCurrentDirectory = strCurrentDirectory.substring(8, strCurrentDirectory.length - 1);
            strCurrentDirectory = strCurrentDirectory.substring(0, strCurrentDirectory.lastIndexOf("/"));
        }
        // Script was started inside a .chm file
        else if (strTemp.substring(0, 14) == "mk:@msitstore:")
        {
            strCurrentDirectory = strCurrentDirectory.substring(14, strCurrentDirectory.length - 1);
            strCurrentDirectory = strCurrentDirectory.substring(0, strCurrentDirectory.lastIndexOf("::"));
            strCurrentDirectory = strCurrentDirectory.substring(0, strCurrentDirectory.lastIndexOf("\\"));
        }

        strCurrentDirectory = strCurrentDirectory.replace(/%20/, " ");
    }

    var strLocalDirectory   = strCurrentDirectory;
    var strGlobalDirectory  = strLocalDirectory;
    var strRelativePath     = "";
    var arrFileList         = new Array();
    var arrRelativePaths    = new Array();
    var nFileCount          = 0;

    // Determine global help directory
    {
        strTemp = strLocalDirectory.toLowerCase();

        if (strTemp.indexOf("help-de") != -1)
        {
            strRelativePath     = "../../../../AS/Help-de/Data/RevInfos";
            strGlobalDirectory  = strGlobalDirectory + "/" + strRelativePath;
        }
        else if (strTemp.indexOf("help-en") != -1)
        {
            strRelativePath     = "../../../../AS/Help-en/Data/RevInfos";
            strGlobalDirectory  = strGlobalDirectory + "/" + strRelativePath;
        }
    }

    // Get all files from local and global help directory and store them into an array
    {
        var fso = new ActiveXObject("Scripting.FileSystemObject");
        var folder;
        var files;

        // Get all files from local help directory
        if (fso.FolderExists(strLocalDirectory))
        {
            folder  = fso.GetFolder(strLocalDirectory);
            files   = new Enumerator(folder.Files);

            for (i = 0; ! files.atEnd(); files.moveNext())
            {
                arrFileList[nFileCount]         =   files.item().name;
                arrRelativePaths[nFileCount]    =   "";
                nFileCount                      ++;
            }
        }

        // Get all files from global help directory
        if (fso.FolderExists(strGlobalDirectory))
        {
            folder  = fso.GetFolder(strGlobalDirectory);
            files   = new Enumerator(folder.Files);

            for (i = 0; ! files.atEnd(); files.moveNext())
            {
                arrFileList[nFileCount]         =   files.item().name;
                arrRelativePaths[nFileCount]    =   strRelativePath;
                nFileCount                      ++;
            }
        }
    }

    // Search for revision information files (.pdf) in current directory and build a link for each .pdf file
    {
        var arrFileNames    = new Array();
        var arrDisplayNames = new Array();
        var arrTypes        = new Array();
        var argArray        = new Array();
        var count           = 0;
        var nType           = 0;
        var startPos;
        var strFileName;
        var strFileNameTemp;
        var strDisplayName;
        var strLine;
        var strTemp;

        for (i in arrFileList)
        {
            strFileName     = arrFileList[i];
            strRelativePath = arrRelativePaths[i];
            strTemp         = strFileName.toLowerCase();

            // Check if current file is a valid revision information file:
            // - Extension must be ".pdf"
            // - File name must contain either "_AsInfo", "_RevInfo" or must start with "KB_"
            if (strTemp.indexOf(".pdf") != -1)
            {
                if (((((strTemp.indexOf("_asinfo") != -1) || (strTemp.indexOf("_revinfo") != -1)) && (strTemp.indexOf("_news") == -1))) ||
                    (strTemp.substring(0, 3) == "kb_"))
                {
                    strDisplayName = strFileName.substring(0, strFileName.length - 4);

                    // Remove "_AsInfo" from string if needed
                    if ((startPos = strTemp.indexOf("_asinfo")) != -1)
                    {
                        strDisplayName = strDisplayName.substring(0, startPos);
                    }
                    // Remove "_RevInfoD" from string if needed
                    else if ((startPos = strTemp.indexOf("_revinfod")) != -1)
                    {
                        strDisplayName = strDisplayName.substring(0, startPos);
                    }
                    // Remove "_RevInfoE" from string if needed
                    else if ((startPos = strTemp.indexOf("_revinfoe")) != -1)
                    {
                        strDisplayName = strDisplayName.substring(0, startPos);
                    }
                    // Remove "_RevInfo" from string if needed
                    else if ((startPos = strTemp.indexOf("_revinfo")) != -1)
                    {
                        strDisplayName = strDisplayName.substring(0, startPos);
                    }

                    // Reformat the version string and determine the version type
                    argArray.strDisplayName = strDisplayName;
                    argArray.nType          = 0;
                    argArray.nDisplayType   = 1;
                    argArray                = FormatVersionString(argArray);

                    // Add file name and display name to the appropriate array
                    {
                        if (strRelativePath == "")
                        {
                            strFileNameTemp = strFileName;
                        }
                        else
                        {
                            strFileNameTemp = strRelativePath + "/" + strFileName;
                        }

                        count = AddEntryToArray(strFileNameTemp, arrFileNames, argArray.strDisplayName, arrDisplayNames,
                                                argArray.nType, arrTypes, count);
                    }
                }
            }
        }

        // Create a new array for each version type and copy all elements to the appropriate array
        {
            var arrFileNamesAS          = new Array();
            var arrDisplayNamesAS       = new Array();
            var countAS                 = 0;
            var arrFileNamesAN          = new Array();
            var arrDisplayNamesAN       = new Array();
            var countAN                 = 0;
            var arrFileNamesAR          = new Array();
            var arrDisplayNamesAR       = new Array();
            var countAR                 = 0;
            var arrFileNamesAH          = new Array();
            var arrDisplayNamesAH       = new Array();
            var countAH                 = 0;
            var arrFileNamesHW          = new Array();
            var arrDisplayNamesHW       = new Array();
            var countHW                 = 0;
            var arrFileNamesVC          = new Array();
            var arrDisplayNamesVC       = new Array();
            var countVC                 = 0;
            var arrFileNamesMotion      = new Array();
            var arrDisplayNamesMotion   = new Array();
            var countMotion             = 0;
            var arrFileNamesKnownBugs       = new Array();
            var arrDisplayNamesKnownBugs    = new Array();
            var countKnownBugs              = 0;
            var arrFileNamesOther       = new Array();
            var arrDisplayNamesOther    = new Array();
            var countOther              = 0;

            // Loop through all revision infos and copy them to the approriate array
            for (i in arrFileNames)
            {
                switch (arrTypes[i])
                {
                    // Other revision info (unknown type)
                    case 0:
                    {
                        arrFileNamesOther[countOther]       =   arrFileNames[i];
                        arrDisplayNamesOther[countOther]    =   arrDisplayNames[i];
                        countOther                          ++;
                        break;
                    }

                    // Automation Studio
                    case 1:
                    {
                        arrFileNamesAS[countAS]     =   arrFileNames[i];
                        arrDisplayNamesAS[countAS]  =   arrDisplayNames[i];
                        countAS                     ++;
                        break;
                    }

                    // Automation Net
                    case 2:
                    {
                        arrFileNamesAN[countAN]     =   arrFileNames[i];
                        arrDisplayNamesAN[countAN]  =   arrDisplayNames[i];
                        countAN                     ++;
                        break;
                    }

                    // Automation Runtime
                    case 3:
                    {
                        arrFileNamesAR[countAR]     =   arrFileNames[i];
                        arrDisplayNamesAR[countAR]  =   arrDisplayNames[i];
                        countAR                     ++;
                        break;
                    }

                    // Automation Help
                    case 4:
                    {
                        arrFileNamesAH[countAH]     =   arrFileNames[i];
                        arrDisplayNamesAH[countAH]  =   arrDisplayNames[i];
                        countAH                     ++;
                        break;
                    }

                    // Hardware
                    case 5:
                    {
                        arrFileNamesHW[countHW]     =   arrFileNames[i];
                        arrDisplayNamesHW[countHW]  =   arrDisplayNames[i];
                        countHW                     ++;
                        break;
                    }

                    // Visual Components Firmware
                    case 6:
                    {
                        arrFileNamesVC[countVC]     =   arrFileNames[i];
                        arrDisplayNamesVC[countVC]  =   arrDisplayNames[i];
                        countVC                     ++;
                        break;
                    }

                    // Motion Components Firmware
                    case 7:
                    {
                        arrFileNamesMotion[countMotion]     =   arrFileNames[i];
                        arrDisplayNamesMotion[countMotion]  =   arrDisplayNames[i];
                        countMotion                         ++;
                        break;
                    }

                    // Known Bugs
                    case 8:
                    {
                        arrFileNamesKnownBugs[countKnownBugs]       =   arrFileNames[i];
                        arrDisplayNamesKnownBugs[countKnownBugs]    =   arrDisplayNames[i];
                        countKnownBugs                              ++;
                        break;
                    }
                }
            }

            // Sort revision info arrays alphabetically
            SortInfos(arrFileNamesAS, arrDisplayNamesAS);
            SortInfos(arrFileNamesAN, arrDisplayNamesAN);
            SortInfos(arrFileNamesAR, arrDisplayNamesAR);
            SortInfos(arrFileNamesAH, arrDisplayNamesAH);
            SortInfos(arrFileNamesHW, arrDisplayNamesHW);
            SortInfos(arrFileNamesVC, arrDisplayNamesVC);
            SortInfos(arrFileNamesMotion, arrDisplayNamesMotion);
            SortInfos(arrFileNamesKnownBugs, arrDisplayNamesKnownBugs);
            SortInfos(arrFileNamesOther, arrDisplayNamesOther);
        }

        // Write all links to .html file
        WriteLinks("Automation Studio", arrFileNamesAS, arrDisplayNamesAS);
        WriteLinks("Automation Net", arrFileNamesAN, arrDisplayNamesAN);
        WriteLinks("Automation Runtime", arrFileNamesAR, arrDisplayNamesAR);
        WriteLinks("Automation Help", arrFileNamesAH, arrDisplayNamesAH);
        WriteLinks("Hardware", arrFileNamesHW, arrDisplayNamesHW);
        WriteLinks("Visual Components Firmware", arrFileNamesVC, arrDisplayNamesVC);
        WriteLinks("Motion Components Firmware", arrFileNamesMotion, arrDisplayNamesMotion);
        WriteLinks("Known Problems", arrFileNamesKnownBugs, arrDisplayNamesKnownBugs);
        WriteLinks("Other Upgrades", arrFileNamesOther, arrDisplayNamesOther);
    }
}

function DisplayCompatibilityInfos()
{
    var strCurrentDirectory = window.location.href;
    var strTemp             = strCurrentDirectory.toLowerCase();

    // Get current directory
    {
        // Script was started from a simple .html file
        if (strTemp.substring(0, 8) == "file:///")
        {
            strCurrentDirectory = strCurrentDirectory.substring(8, strCurrentDirectory.length - 1);
            strCurrentDirectory = strCurrentDirectory.substring(0, strCurrentDirectory.lastIndexOf("/"));
        }
        // Script was started inside a .chm file
        else if (strTemp.substring(0, 14) == "mk:@msitstore:")
        {
            strCurrentDirectory = strCurrentDirectory.substring(14, strCurrentDirectory.length - 1);
            strCurrentDirectory = strCurrentDirectory.substring(0, strCurrentDirectory.lastIndexOf("::"));
            strCurrentDirectory = strCurrentDirectory.substring(0, strCurrentDirectory.lastIndexOf("\\"));
        }

        strCurrentDirectory = strCurrentDirectory.replace(/%20/, " ");
    }

    var strLocalDirectory   = strCurrentDirectory;
    var strGlobalDirectory  = strLocalDirectory;
    var strRelativePath     = "";
    var arrFileList         = new Array();
    var arrRelativePaths    = new Array();
    var nFileCount          = 0;

    // Determine global help directory
    {
        strTemp = strLocalDirectory.toLowerCase();

        if (strTemp.indexOf("help-de") != -1)
        {
            strRelativePath     = "../../../../AS/Help-de/Data/RevInfos";
            strGlobalDirectory  = strGlobalDirectory + "/" + strRelativePath;
        }
        else if (strTemp.indexOf("help-en") != -1)
        {
            strRelativePath     = "../../../../AS/Help-en/Data/RevInfos";
            strGlobalDirectory  = strGlobalDirectory + "/" + strRelativePath;
        }
    }

    // Get all files from local and global help directory and store them into an array
    {
        var fso = new ActiveXObject("Scripting.FileSystemObject");
        var folder;
        var files;

        // Get all files from local help directory
        if (fso.FolderExists(strLocalDirectory))
        {
            folder  = fso.GetFolder(strLocalDirectory);
            files   = new Enumerator(folder.Files);

            for (i = 0; ! files.atEnd(); files.moveNext())
            {
                arrFileList[nFileCount]         =   files.item().name;
                arrRelativePaths[nFileCount]    =   "";
                nFileCount                      ++;
            }
        }

        // Get all files from global help directory
        if (fso.FolderExists(strGlobalDirectory))
        {
            folder  = fso.GetFolder(strGlobalDirectory);
            files   = new Enumerator(folder.Files);

            for (i = 0; ! files.atEnd(); files.moveNext())
            {
                arrFileList[nFileCount]         =   files.item().name;
                arrRelativePaths[nFileCount]    =   strRelativePath;
                nFileCount                      ++;
            }
        }
    }

    // Search for combatibility information files (.pdf) in current directory and build a link for each .pdf file
    {
        var arrFileNames    = new Array();
        var arrDisplayNames = new Array();
        var arrTypes        = new Array();
        var argArray        = new Array();
        var count           = 0;
        var nType           = 0;
        var startPos;
        var strFileName;
        var strFileNameTemp;
        var strDisplayName;
        var strLine;
        var strTemp;

        for (i in arrFileList)
        {
            strFileName     = arrFileList[i];
            strRelativePath = arrRelativePaths[i];
            strTemp         = strFileName.toLowerCase();

            // Check if current file is a valid combatibility information file:
            // - Extension must be ".pdf"
            // - File name must start with "Compatibility_"
            if ((strTemp.indexOf(".pdf") != -1) && (strTemp.substring(0, 14) == "compatibility_"))
            {
                strDisplayName  = strFileName.substring(0, strFileName.length - 4);
                strDisplayName  = DeleteString(strDisplayName, 0, 14);

                // Remove "_d" or "_e" at the end of string if needed
                if ((strTemp.indexOf("_d.pdf") != -1) || (strTemp.indexOf("_e.pdf") != -1))
                {
                    strDisplayName = DeleteString(strDisplayName, strDisplayName.length - 2, 2);
                }

                // Reformat the version string and determine the version type
                argArray.strDisplayName = strDisplayName;
                argArray.nType          = 0;
                argArray.nDisplayType   = 2;
                argArray                = FormatVersionString(argArray);

                // Add file name and display name to the appropriate array
                {
                    if (strRelativePath == "")
                    {
                        strFileNameTemp = strFileName;
                    }
                    else
                    {
                        strFileNameTemp = strRelativePath + "/" + strFileName;
                    }

                    count = AddEntryToArray(strFileNameTemp, arrFileNames, argArray.strDisplayName, arrDisplayNames,
                                            argArray.nType, arrTypes, count);
                }
            }
        }

        // Create a new array for each version type and copy all elements to the appropriate array
        {
            var arrFileNamesAS          = new Array();
            var arrDisplayNamesAS       = new Array();
            var countAS                 = 0;
            var arrFileNamesAN          = new Array();
            var arrDisplayNamesAN       = new Array();
            var countAN                 = 0;
            var arrFileNamesAR          = new Array();
            var arrDisplayNamesAR       = new Array();
            var countAR                 = 0;
            var arrFileNamesAH          = new Array();
            var arrDisplayNamesAH       = new Array();
            var countAH                 = 0;
            var arrFileNamesHW          = new Array();
            var arrDisplayNamesHW       = new Array();
            var countHW                 = 0;
            var arrFileNamesVC          = new Array();
            var arrDisplayNamesVC       = new Array();
            var countVC                 = 0;
            var arrFileNamesMotion      = new Array();
            var arrDisplayNamesMotion   = new Array();
            var countMotion             = 0;

            // Loop through all combatibility infos and copy them to the approriate array
            for (i in arrFileNames)
            {
                switch (arrTypes[i])
                {
                    // Automation Studio
                    case 1:
                    {
                        arrFileNamesAS[countAS]     =   arrFileNames[i];
                        arrDisplayNamesAS[countAS]  =   arrDisplayNames[i];
                        countAS                     ++;
                        break;
                    }

                    // Automation Net
                    case 2:
                    {
                        arrFileNamesAN[countAN]     =   arrFileNames[i];
                        arrDisplayNamesAN[countAN]  =   arrDisplayNames[i];
                        countAN                     ++;
                        break;
                    }

                    // Automation Runtime
                    case 3:
                    {
                        arrFileNamesAR[countAR]     =   arrFileNames[i];
                        arrDisplayNamesAR[countAR]  =   arrDisplayNames[i];
                        countAR                     ++;
                        break;
                    }

                    // Automation Help
                    case 4:
                    {
                        arrFileNamesAH[countAH]     =   arrFileNames[i];
                        arrDisplayNamesAH[countAH]  =   arrDisplayNames[i];
                        countAH                     ++;
                        break;
                    }

                    // Hardware
                    case 5:
                    {
                        arrFileNamesHW[countHW]     =   arrFileNames[i];
                        arrDisplayNamesHW[countHW]  =   arrDisplayNames[i];
                        countHW                     ++;
                        break;
                    }

                    // Visual Components
                    case 6:
                    {
                        arrFileNamesVC[countVC]     =   arrFileNames[i];
                        arrDisplayNamesVC[countVC]  =   arrDisplayNames[i];
                        countVC                     ++;
                        break;
                    }

                    // Motion Components
                    case 7:
                    {
                        arrFileNamesMotion[countMotion]     =   arrFileNames[i];
                        arrDisplayNamesMotion[countMotion]  =   arrDisplayNames[i];
                        countMotion                         ++;
                        break;
                    }
                }
            }

            // Sort combatibility info arrays alphabetically
            SortInfos(arrFileNamesAS, arrDisplayNamesAS);
            SortInfos(arrFileNamesAN, arrDisplayNamesAN);
            SortInfos(arrFileNamesAR, arrDisplayNamesAR);
            SortInfos(arrFileNamesAH, arrDisplayNamesAH);
            SortInfos(arrFileNamesHW, arrDisplayNamesHW);
            SortInfos(arrFileNamesVC, arrDisplayNamesVC);
            SortInfos(arrFileNamesMotion, arrDisplayNamesMotion);
        }

        // Write all links to .html file
        WriteLinks("Automation Studio", arrFileNamesAS, arrDisplayNamesAS);
        WriteLinks("Automation Net", arrFileNamesAN, arrDisplayNamesAN);
        WriteLinks("Automation Runtime", arrFileNamesAR, arrDisplayNamesAR);
        WriteLinks("Automation Help", arrFileNamesAH, arrDisplayNamesAH);
        WriteLinks("Hardware", arrFileNamesHW, arrDisplayNamesHW);
        WriteLinks("Visual Components", arrFileNamesVC, arrDisplayNamesVC);
        WriteLinks("Motion Components", arrFileNamesMotion, arrDisplayNamesMotion);
    }
}

function AddEntryToArray(strFileName, arrFileNames, strDisplayName, arrDisplayNames, nType, arrTypes, nCount)
{
    var bFound              = false;
    var nCountResult        = nCount;
    var strDisplayNameTemp  = strDisplayName.toLowerCase();
    var strTemp;
    var i;

    for (i = 0; i < arrDisplayNames.length; i ++)
    {
        strTemp = arrDisplayNames[i].toLowerCase();

        if ((strDisplayNameTemp == strTemp) && (nType == arrTypes[i]))
        {
            bFound = true;
            break;
        }
    }

    if (! bFound)
    {
        arrFileNames[nCount]    = strFileName;
        arrDisplayNames[nCount] = strDisplayName;
        arrTypes[nCount]        = nType;
        nCountResult ++;
    }

    return (nCountResult);
}

function SortInfos(arrFileNames, arrDisplayNames)
{
    var strFileNameTemp;
    var strDisplayNameTemp;
    var strTempCurrent;
    var strTempNext;
    var i;
    var bNotSorted = true;

    while (bNotSorted)
    {
        bNotSorted = false;

        for (i = 0; (i + 1) < arrFileNames.length; i ++)
        {
            strTempCurrent  = arrDisplayNames[i].replace(/ /g, "");
            strTempNext     = arrDisplayNames[i + 1].replace(/ /g, "");

            if (strTempCurrent > strTempNext)
            {
                bNotSorted              = true;
                strFileNameTemp         = arrFileNames[i];
                strDisplayNameTemp      = arrDisplayNames[i];
                arrFileNames[i]         = arrFileNames[i + 1];
                arrDisplayNames[i]      = arrDisplayNames[i + 1];
                arrFileNames[i + 1]     = strFileNameTemp;
                arrDisplayNames[i + 1]  = strDisplayNameTemp;
            }
        }
    }
}

function FormatVersionString(argArray)
{
    var strDisplayName  = argArray.strDisplayName;
    var strTemp         = strDisplayName.toUpperCase();
    var nType           = 0;

    // Replace all "_" with spaces
    strDisplayName = strDisplayName.replace(/_/g, " ");

    switch (argArray.nDisplayType)
    {
        // Revision information
        case 1:
        {
            // String starts with "AS3.0_AS_", "AS2.6_AS_" or "AS2.7_AS_" ==> We'll assume it's a AS upgrade
            if ((strTemp.substring(0, 9) == "AS3.0_AS_") || (strTemp.substring(0, 9) == "AS2.6_AS_") ||
                     (strTemp.substring(0, 9) == "AS2.7_AS_"))
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 9);
                nType           = 1;
            }
            // String starts with "AS3.0_HW_", "AS2.6_HW_" or "AS2.7_HW_" ==> We'll assume it's a Hardware upgrade
            else if ((strTemp.substring(0, 9) == "AS3.0_HW_") || (strTemp.substring(0, 9) == "AS2.6_HW_") ||
                     (strTemp.substring(0, 9) == "AS2.7_HW_"))
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 9);
                nType           = 5;
            }
            // String starts with "AS3.0_VC_", "AS2.6_VC_" or "AS2.7_VC_" ==> We'll assume it's a VC upgrade
            else if ((strTemp.substring(0, 9) == "AS3.0_VC_") || (strTemp.substring(0, 9) == "AS2.6_VC_") ||
                     (strTemp.substring(0, 9) == "AS2.7_VC_"))
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 9);
                strDisplayName  = InsertString(strDisplayName, 0, "VC Runtime ");
                nType           = 6;
            }
            // String starts with "AS3.0_", "AS2.6_" or "AS2.7_" ==> We'll assume it's an AS upgrade
            else if ((strTemp.substring(0, 6) == "AS3.0_") || (strTemp.substring(0, 6) == "AS2.6_") ||
                     (strTemp.substring(0, 6) == "AS2.7_"))
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 6);
                strTemp         = DeleteString(strTemp, 0, 6);

                if (strTemp.substring(0, 3) == "AS_")
                {
                    strDisplayName = DeleteString(strDisplayName, 0, 3);
                }

                nType = 1;
            }
            // String starts with "AS3" ==> We'll assume it's an Automation Studio version (full version)
            else if (strTemp.substring(0, 3) == "AS3")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 2);
                nType           = 1;
            }
            // String starts with "AN" ==> We'll assume it's an Automation Net (PVI) upgrade
            else if (strTemp.substring(0, 2) == "AN")
            {
                strDisplayName = DeleteString(strDisplayName, 0, 2);

                if ((strDisplayName.length == 7) && (strDisplayName. indexOf(".") == -1))
                {
                    strDisplayName = InsertString(strDisplayName, 1, ".");
                    strDisplayName = InsertString(strDisplayName, 3, ".");
                    strDisplayName = InsertString(strDisplayName, 5, ".");
                }

                // PVI Development upgrade
                if (strDisplayName.substring(strDisplayName.length - 4, strDisplayName.length - 2) == "30")
                {
                    strDisplayName = InsertString(strDisplayName, 0, "PVI Development ");
                }
                // PVI Runtime upgrade
                else if (strDisplayName.substring(strDisplayName.length - 4, strDisplayName.length - 2) == "31")
                {
                    strDisplayName = InsertString(strDisplayName, 0, "PVI Runtime ");
                }

                nType = 2;
            }
            // String starts with "ARSG" ==> We'll assume it's an Automation Runtime upgrade
            else if (strTemp.substring(0, 4) == "ARSG")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 2);
                nType           = 3;
            }
            // String starts with "AH" ==> We'll assume it's an Automation Help upgrade
            else if (strTemp.substring(0, 2) == "AH")
            {
                strDisplayName = DeleteString(strDisplayName, 0, 2);

                if ((strDisplayName.length == 13) && (strDisplayName. indexOf(".") == -1) && (strDisplayName.substring(4, 5) == " "))
                {
                    strDisplayName = InsertString(strDisplayName, 1, ".");
                    strDisplayName = InsertString(strDisplayName, 3, ".");
                    strDisplayName = InsertString(strDisplayName, 11, ".");
                    strDisplayName = InsertString(strDisplayName, 14, ".");
                }

                nType = 4;
            }
            // String starts with "HW_" ==> We'll assume it's a Hardware upgrade
            else if (strTemp.substring(0, 3) == "HW_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 5;
            }
            // String starts with "VC_" ==> We'll assume it's a VC upgrade
            else if (strTemp.substring(0, 3) == "VC_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                strDisplayName  = InsertString(strDisplayName, 0, "VC Runtime ");
                nType           = 6;
            }
            // String starts with "ACP10" or "ARNC0" ==> We'll assume it's a Motion upgrade
            else if ((strTemp.substring(0, 5) == "ACP10") || (strTemp.substring(0, 5) == "ARNC0"))
            {
                nType = 7;
            }
            // String starts with "KB_" ==> We'll assume it's a Known Bugs file
            else if (strTemp.substring(0, 3) == "KB_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 8;
            }
            // Other upgrades
            else
            {
                if (strTemp.substring(0, 2) == "AS")
                {
                    strDisplayName = DeleteString(strDisplayName, 0, 2);

                    if ((strDisplayName.length == 7) && (strDisplayName. indexOf(".") == -1))
                    {
                        strDisplayName = InsertString(strDisplayName, 1, ".");
                        strDisplayName = InsertString(strDisplayName, 3, ".");
                        strDisplayName = InsertString(strDisplayName, 5, ".");
                    }

                    // AR010 upgrade
                    if (strDisplayName.substring(strDisplayName.length - 4, strDisplayName.length - 1) == "410")
                    {
                        strDisplayName  = InsertString(strDisplayName, 0, "AR010 ");
                        nType           = 3;
                    }
                    // AR SG3 upgrade (old style)
                    else if (strDisplayName.substring(strDisplayName.length - 4, strDisplayName.length - 1) == "144")
                    {
                        strDisplayName  = InsertString(strDisplayName, 0, "SG3 ");
                        nType           = 3;
                    }
                }
            }

            break;
        }

        // Compatibility information
        case 2:
        {
            // Replace "to" with " ==> "
            strDisplayName = strDisplayName.replace(/to/g, " => ");

            // Automation Studio
            if (strTemp.substring(0, 3) == "AS_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 1;
            }
            // Automation Net
            else if (strTemp.substring(0, 3) == "AN_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 2;
            }
            // Automation Runtime
            else if (strTemp.substring(0, 3) == "AR_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 3;
            }
            // Automation Help
            else if (strTemp.substring(0, 3) == "AH_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 4;
            }
            // Hardware
            else if (strTemp.substring(0, 3) == "HW_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 5;
            }
            // Visual Components
            else if (strTemp.substring(0, 3) == "VC_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 6;
            }
            // Motion Components
            else if (strTemp.substring(0, 3) == "MC_")
            {
                strDisplayName  = DeleteString(strDisplayName, 0, 3);
                nType           = 7;
            }

            break;
        }
    }

    // Return multiple return values using an argument array
    argArray.strDisplayName = strDisplayName;
    argArray.nType          = nType;
    return (argArray);
}

function InsertString(strSource, pos, strInsert)
{
    var strResult = strSource;
    var strTemp;

    if (pos < strSource.length)
    {
        strResult   =   strSource.substring(0, pos);
        strTemp     =   strSource.substring(pos, strSource.length);
        strResult   +=  strInsert;
        strResult   +=  strTemp;
    }

    return (strResult);
}

function DeleteString(strSource, startPos, count)
{
    var strResult;
    var strTemp;

    strResult   =   strSource.substring(0, startPos);
    strTemp     =   strSource.substring(startPos + count, strSource.length);
    strResult   +=  strTemp;
    return (strResult);
}

function WriteLinks(strCategory, arrFileNames, arrDisplayNames)
{
    if (arrFileNames.length > 0)
    {
        document.write("<h2>" + strCategory + "</h2>");
        document.write("<blockquote>");

        for (i in arrFileNames)
        {
            document.write("<a href=\"" + arrFileNames[i] + "\">" + arrDisplayNames[i] + " (PDF)" + "</a><br>");
        }

        document.write("</blockquote>");
    }
}
