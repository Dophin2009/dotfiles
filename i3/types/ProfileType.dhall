let ColorRow =
      { border : Text, bg : Text, text : Text, indic : Text, cborder : Text }

in  { font : { family : Text, size : Natural }
    , colors :
        { foc : ColorRow
        , foc_in : ColorRow
        , unfoc : ColorRow
        , urgent : ColorRow
        , ph : ColorRow
        }
    , gaps : { inner : Natural, outer : Natural }
    }
