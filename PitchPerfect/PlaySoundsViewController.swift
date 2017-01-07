//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Thiago Andrade on 2017-01-07.
//  Copyright © 2017 Thiago Andrade. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

  var audioRecorderDescriptor: AudioRecorderDescriptor!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  public func setAudioDescriptor(_ audioRecorderDescriptor: AudioRecorderDescriptor) {
    self.audioRecorderDescriptor = audioRecorderDescriptor;
  }

  public func play() {
    print("play the audio");
  }

  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
