//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [[Any]]()
        
        //------------------------ここから下にクイズを書く------------------------//
        tmpArray.append(["ロンドン塔が世界遺産になったのはいつ？", "2001", "1988", "1982", 2])
        tmpArray.append(["ガラホナイ国立公園はどこの世界遺産？", "スペイン", "アメリカ", "フランス", 1])
        tmpArray.append(["バターリャの修道院はどこの世界遺産？", "ポルトガル", "イタリア", "英国", 1])
        tmpArray.append(["インドには何個の世界遺産がある？", "34", "35", "36", 2])
        tmpArray.append(["トルクメニスタンの最初の世界遺産はいつ登録された？", "1989", "1999", "2009", 2])
        tmpArray.append(["オーストラリアの最も最近に登録された世界遺産はどれ？", "ロード・ハウ諸島", "フレーザー島", "ニンガルー・コースト", 3])
        tmpArray.append(["パラオにある唯一の世界遺産はどれ？", "文化遺産", "自然遺産", "複合遺産", 3])
        tmpArray.append(["イエメンにある世界遺産で危機遺産はどれ？", "古都ザビード", "シバームの旧城壁都市", "ソコトラ諸島", 1])
        tmpArray.append(["オマーンで登録削除された遺産はどれ？", "バハラ城塞", "アラビアオリックスの保護区", "フランキンセンスの国土", 2])
        tmpArray.append(["カナダにある世界遺産はどれ？", "タオス・プエブロ", "レオン大聖堂", "スカン・グアイ", 3])
        
        //------------------------ここから上にクイズを書く------------------------//
        
        // 問題をシャッフルしてquizArrayに格納する
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        choiceQuiz()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
    
    
    
}


