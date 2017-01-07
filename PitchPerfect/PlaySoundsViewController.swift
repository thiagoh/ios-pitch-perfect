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

  // MARK: Outlets

  @IBOutlet weak var snailButton: UIButton!
  @IBOutlet weak var chipmunkButton: UIButton!
  @IBOutlet weak var rabbitButton: UIButton!
  @IBOutlet weak var vaderButton: UIButton!
  @IBOutlet weak var echoButton: UIButton!
  @IBOutlet weak var reverbButton: UIButton!
  @IBOutlet weak var stopButton: UIButton!

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

  // MARK: Actions

  @IBAction func playSoundForButton(_ sender: UIButton) {
    print("Play Sound Button Pressed")
  }

  @IBAction func stopButtonPressed(_ sender: AnyObject) {
    print("Stop Audio Button Pressed")
  }
}
