//
//  JPAnnotatedTV.swift
//  mention
//
//  Created by Jatin on 15/10/15.
//  Copyright © 2015 jatin. All rights reserved.
//

import UIKit

class JPAnnotatedTV: UITextView, UITextViewDelegate {
  var path = UIBezierPath()

    override func drawRect(rect: CGRect) {
        // Drawing code
      drawOn(text)
    }

  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
  }

  func textViewDidChange(textView: UITextView) {
    setNeedsDisplay()
  }


  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  func setup() {
    backgroundColor = UIColor.whiteColor()
  }


  func drawOn(text: String) {

    print(selectedRange)
    _ = text.rangeOfString("#jatin")

    let tt = text.componentsSeparatedByString(" ")
    let mm = tt.filter { (elem) -> Bool in
      let temp = elem as String
      return temp.containsString("#")
    }
//
//    var ranges = [NSRange]()
//    for m in mm {
//      let rng = text.rangeOfString(
    m)
//      print(<#T##items: Any...##Any#>)
//    }

    let range = NSMakeRange(3, 6)
    let begining = beginningOfDocument
    let start = positionFromPosition(begining, offset: range.location)
    let end = positionFromPosition(start! , offset: range.length)


    let textRange = textRangeFromPosition(start!, toPosition: end!)
    let rect = firstRectForRange(textRange!)
    print(rect)


    path = UIBezierPath(roundedRect: rect, cornerRadius: 10)

    UIColor.redColor().setStroke()
    UIColor.redColor().setFill()
        path.fill()
    path.lineWidth = 1.0
    path.stroke()
  }

}
