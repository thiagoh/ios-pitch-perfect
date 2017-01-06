//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Thiago Andrade on 2017-01-04.
//  Copyright © 2017 Thiago Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var recording: Bool!;
  @IBOutlet weak var recordingLabel: UILabel!;
  @IBOutlet weak var recordingButton: UIButton!;
  @IBOutlet weak var stopRecordingButton: UIButton!;

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder);

    print("this is the first method", aDecoder);
    recording = false;
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated);

    print("view will appear");
    recordingButton.isEnabled = !recording;
    stopRecordingButton.isEnabled = recording;
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func recordAudio(_ sender: Any) {
    print("print record button was pressed");

    recording = true;

    recordingLabel.text = "Recording in Progress...";
    recordingButton.isEnabled = false;
    stopRecordingButton.isEnabled = true;
  }

  @IBAction func stopRecording(_ sender: Any) {
    print("stop recording!");

    recording = false;

    recordingLabel.text = "Record finished";
    recordingButton.isEnabled = true;
    stopRecordingButton.isEnabled = false;
  }
}

