# プレイヤー(自分)に「0~2」を入力させるロジック
class Player
    # プレイヤーにじゃんけんの手を選択させる
    def hand
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        # 変数「input_hand」にプレイヤーの入力値を代入
        input_hand = gets.chomp
        # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外だと繰り返し処理を継続
        while true
             # if 「input_hand」が「0, 1, 2」のいずれかの場合だった場合
            if input_hand == "0" || input_hand == "1" || input_hand == "2"
                # 「input_hand」をそのまま返す
                return input_hand.to_i
            # それ以外の場合
            else
                # プレイヤーに「0〜2」を入力させる文章を表示
                puts "数字を入力してください。"
                puts "0:グー, 1:チョキ, 2:パー"
                # 変数「input_hand」にプレイヤーの入力値を代入
                input_hand = gets.chomp
            # end if文のend
            end
        end
    end
end

# 相手が「0~2」の値をランダムに生成
class Enemy
    def hand
        # グー、チョキ、パーの値をランダムに取得
        return rand(0..2)
    end
end


# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力する
class Janken
    def pon(player_hand, enemy_hand)
        # 変数「janken」に["グー", "チョキ", "パー"]を代入
        janken = ["グー", "チョキ", "パー"]
        #「相手の手は#{相手の手}です。」と出力
        puts "相手の手は#{janken[enemy_hand]}です。"
        # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんする
        if player_hand == enemy_hand
             # Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合,「あいこ」を出力
            puts "あいこ";
            #「true」を返してじゃんけんを繰り返し実行
            true;
        elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0) 
            puts "あなたの勝ちです"
            #「false」を返してじゃんけんを終了
            false;
        else
            puts "あなたの負けです"
            #「false」を返してじゃんけんを終了
            false;
        end
    end
end

# じゃんけんゲームを実行するロジック
class GameStart
# selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
    def self.jankenpon
      # 変数にそれをインスタンス化したものを代入
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      # 変数「next_game」に「true」を代入しましょう。
      # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
      next_game = true
      while next_game do
        # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
        #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
        next_game = janken.pon(player.hand, enemy.hand)
      end
    end
end

# クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon