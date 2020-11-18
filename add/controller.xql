xquery version "1.0";

declare variable $exist:path external;
declare variable $exist:resource external;

if ($exist:path eq "/") then
    (: forward root path to index.xql :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <forward url="index.html"/>
    </dispatch>
else if ($exist:path eq "/aschenbroedel") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/aschenbroedel/edition-HT_Isouard.xml"/>
    </dispatch>
else if ($exist:path eq "/bettelstudent") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/bettelstudent/edition-HT_Bettelstudent.xml"/>
    </dispatch>
else if ($exist:path eq "/derKapellmeister") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/derKapellmeister/edition_DerKapellmeister.xml"/>
    </dispatch>
else if ($exist:path eq "/desTeufelsAnteil") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/desTeufelsAnteil/edition-Auber_DesTeufelsAnteil.xml"/>
    </dispatch>
else if ($exist:path eq "/joseph") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/joseph/edition_Joseph_DT.xml"/>
    </dispatch>
else if ($exist:path eq "/josephDresden") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/josephDresden/edition_Joseph_Dresden.xml"/>
    </dispatch>
else if ($exist:path eq "/muellerBalett") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/muellerBalett/edition_MuellerBalett.xml"/>
    </dispatch>
else if ($exist:path eq "/unbekannte") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/unbekannte/edition.xml"/>
    </dispatch>
else if ($exist:path eq "/yelvaLortzing") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/yelvaLortzing/edition_Yelva_Lortzing.xml"/>
    </dispatch>
else if ($exist:path eq "/yelvaReissiger") then
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <redirect url="index.html?edition=xmldb:exist:///db/apps/theater-data/vertaktung/yelvaReissiger/edition_Yelva_Reissiger.xml"/>
    </dispatch>
else
    (: everything else is passed through :)
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <cache-control cache="yes"/>
    </dispatch>