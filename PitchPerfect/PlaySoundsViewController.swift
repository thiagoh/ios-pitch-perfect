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
  @IBOutlet weak var rabbitButton: UIButton!
  @IBOutlet weak var chipmunkButton: UIButton!
  @IBOutlet weak var vaderButton: UIButton!
  @IBOutlet weak var echoButton: UIButton!
  @IBOutlet weak var reverbButton: UIButton!
  @IBOutlet weak var stopButton: UIButton!

  var audioFile: AVAudioFile!
  var audioEngine: AVAudioEngine!
  var audioPlayerNode: AVAudioPlayerNode!
  var stopTimer: Timer!

  enum ButtonType: Int {
    case slow = 1, fast, chipmunk, vader, echo, reverb
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder);
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupAudio();
  }

  override func viewWillAppear(_ animated: Bool) {
    configureUI(PlayingState.notPlaying)
    
    snailButton.tag = ButtonType.slow.rawValue;
    rabbitButton.tag = ButtonType.fast.rawValue;
    chipmunkButton.tag = ButtonType.chipmunk.rawValue;
    vaderButton.tag = ButtonType.vader.rawValue;
    echoButton.tag = ButtonType.echo.rawValue;
    reverbButton.tag = ButtonType.reverb.rawValue;
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
    switch(ButtonType(rawValue: sender.tag)!) {
    case .slow:
      playSound(rate: 0.5)
    case .fast:
      playSound(rate: 1.5)
    case .chipmunk:
      playSound(pitch: 1000)
    case .vader:
      playSound(pitch: -1000)
    case .echo:
      playSound(echo: true)
    case .reverb:
      playSound(reverb: true)
    }

    configureUI(.playing)
  }

  @IBAction func stopButtonPressed(_ sender: AnyObject) {
    print("Stop Audio Button Pressed")
    stopAudio();
  }
}
