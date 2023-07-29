//
//  zoom.swift
//  IceImageMemo
//
//  Created by 山本聖留 on 2023/07/28.
//

import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import UIKit

func convertToMonochrome(image: UIImage) -> UIImage? {
    if let ciImage = CIImage(image: image) {
        let filter = CIFilter.colorMonochrome()
        filter.inputImage = ciImage
        filter.intensity = 1.0 

        if let outputImage = filter.outputImage {
            let context = CIContext()
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
    }
    return nil 
}
func convertToNoir(image: UIImage) -> CIImage {
    let ciImage = CIImage(image: image)
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        filter!.setValue(ciImage, forKey: kCIInputImageKey)
        let output_image = filter?.outputImage
    return output_image!
}

//func adjust_filter(image:UIImage) -> CIImage {
//    let ciimage = CIImage(image: image)
//    let filter = CIFilter(name: "CIColorControls")!
//    filter.setValue(ciimage, forKey: "inputSaturation")
//    //彩度調節
//    filter.setValue(1.0, forKey: "inputSaturation")
//    //明度調節
//    filter.setValue(0.5, forKey: "inputBrightness")
//    //コントラスト調節
//    filter.setValue(2.5,forKey: "inputContrast")
//    let output_Image = filter.outputImage
//
//    return output_Image!
//}

func make_greyscale(image:UIImage) -> CIImage{
    let ciimage = CIImage(image: image)
    let greyscale_filter = CIFilter.maximumComponent()
    greyscale_filter.inputImage = ciimage
    
    let greyscale_image = greyscale_filter.outputImage
        
    return greyscale_image!
}

func make_binary(image:CIImage) ->CIImage{
    let grayscaleImage = image
    let thresholdFilter = CIFilter.colorThreshold()
    thresholdFilter.inputImage = grayscaleImage
    thresholdFilter.threshold = 0.3
    let binaryImage = thresholdFilter.outputImage
    
    return binaryImage!
}

func convert_CtoU(image:CIImage) -> UIImage{
    let image:UIImage = UIImage.init(ciImage: image)
    return image
}
