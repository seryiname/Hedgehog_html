require 'trans_html'

class Hedgehog
  def initialize(name, kind)
    @name = name
    @kind = kind
    @sleep = false
    @eat = 10
    @drink = 10
    @play = 10
    @wc = 10
    @soiled = 15
    @bath = 10
    @playfull = 15
    @mood = 20
    @angry = 10
    @sleep_rate = 10
    @life = 3

  puts  "Привіт! Це #{@name} - він хороший їжачок, дуже хоче турботи та ласки, подбай про нього!)" 
  end

  # Eating

  def eat
    if (@eat > 7)
      puts "#{@name} не хоче їсти. Пограйся з ним"
    else
      puts "#{@name} дуже голодна(ий), з'їсть навіть слона!"
      @eat = 11
    end
    emulator  
    asleep 
  end

  # Drinking

  def drink
    if (@drink > 7)
      puts "#{@name} не хоче пити. Пограйся з ним:)"
    else
      puts "#{@name} дуже спраглий. Де вода-а-а-а?!"
      @drink = 11
    end
    emulator 
    asleep 
  end

  trans_html

  # Game

  def play
    if (@play > 7 || @mood > 12 || @drink > 7 || @angry > 6)
      puts "Їжачок #{@name} проколов м'ячик голками та не 
        хоче гратися. Game over("
    else
      puts "Їжачок #{@name} готовий гратися та чекає тебе. Дай йому пас м'ячиком. Їжачок #{@name} несе тобі м'ячик назад:)"
      @play = 11
    end
    emulator  
    asleep  
  end

  #WC

  def wс
    if (@wc > 5)
      puts "#{@name} не хоче в туалет."
    else
      puts  "#{@name} дуже хоче в туалет, прям не може терпіти. Місію завершено:)"
      @wc = 11
    end
    emulator 
    asleep  
  end

  # Sleep

  def sleep
    puts  "#{@name} солодко заснув та сопить уві сні:)"
    @sleep = true
    4.times do
      if @sleep
        @sleep_rate = 11
        emulator   
      end
      if @sleep
        puts "Їжачок #{@name} безтурботно спить:) "
      end
    end
    if @sleep
      @sleep = false
      puts "Їжачок #{@name} прокинувся та готовий покоряти світ!)"
    end
  end

  # Bath (clean)   

  def bath
    if (@bath > 6 || @soiled > 9)
      puts "#{@name} - чистюля, цьом!"
    else
      puts  "#{@name} потребує купання та турботи:)"
      @bath = 11
    end
    emulator 
    asleep  
  end

  def status
    puts "Голод: #{@eat}"
    puts "Сон: #{@sleep_rate}"
    puts "Настрій: #{@play}"
    puts "Спрага: #{@drink}"
    puts "Туалет: #{@wc}"
    puts "Купання: #{@bath}"
    puts "Життя: #{@life}"
  end
end

private

  def sleep_rate?  #Дуже сонний
    @sleep_rate <= 3
  end

  def hungry?  #Голодний
    @eat <= 3
  end

  def thirst? #Спраглий
    @drink <= 3
  end

  def tired? #Втомлений  
    @play <= 3
  end

  def toilet? #Хоче в туалет
    @wc <= 3
  end

  #Чим ближче до 10, тим менше їжачок хоче спати

  def asleep  
    if (@sleep_rate > 0)
      @sleep_rate -= 1
    end
  end

  #Життєвий (логічний) цикл
  def emulator

    if (@eat > 0)
      @eat -= 1
    else
      if @sleep
        @sleep = false
        puts "Їжачок #{@name} раптово прокинувся..."
      end
      @life -= 1
      puts "У їжачка #{@name} залишилося #{@life} життя."
      @eat = 2
      if @life == 0
        puts "Ти дуже погано дбав про їжачка #{@name} і він утік від тебе!((("
        exit
      end
    end


    if (@drink > 0)
      @drink -= 1
    else
      @life -= 1
      puts "У їжачка #{@name} залишилося #{@life} життя."
      @drink = 2
      if @life == 0
        puts "Їжачок помер від спраги. Він довіряв тобі, а ти його підвів(("
        exit
      end
    end

    if thirst?
      if @sleep
        @sleep = false
        puts "Їжачок #{@name} раптово прокинувся..."
      end
      puts "Їжачок #{@name} дуже хоче пити. Напої його!"
    end

    if hungry?
      if @sleep
        @sleep = false
        puts "Їжачок #{@name} раптово прокинувся..."
      end
      puts "Їжачок #{@name} дуже голодний. Нагодуй його!"
    end

    if toilet?
      if @sleep
        @sleep = false
        puts "Їжачок #{@name} раптово прокинувся..."
      end
      puts "Їжачок #{@name} терміново хоче в кімнатку для роздумів!!!"
    end

    if (@play > 0)
      @play -= 1
    end

    if (@wc > 0)
      @wc -= 1
    end

    if tired?
      puts "Їжачок #{@name} дуже втомлений та сумний. Підніми їжачку настрій, розкажи щось цікаве"
    end

    if sleep_rate?
      puts "Їжачок #{@name} дуже хоче спати. Поклади його в кроватку."
    end

    if @sleep_rate == 0
      puts "Їжачок #{@name} дуже виснажений, тому іде спати.."
      @sleep_rate = 11
    end

    if @wc == 0
      puts "Їжачок #{@name} забрудник коврик. Прибери за ним. І не смій на нього кричати за це!!!"
      @wc = 11
    end
end

puts "Введіть ім'я тваринки:"
name = gets.chomp
puts "Їжачок #{@name} дуже радий тебе бачити, а ти його?"
kind = gets.chomp
hedg = Hedgehog.new name, kind
puts "1 - погодувати"
puts "2 - погратись"
puts "3 - покласти спати"
puts "4 - напоїти"
puts "5 - зводити в туалет"
puts "6 - статистика"
puts "7 - help"
puts "8 - exit"

nm = 0  #navigation_menu

 while nm != 8
   nm = gets.to_i
   case nm
   when 1
    hedg.eat
   when 2
    hedg.play
   when 3
    hedg.sleep
   when 4
    hedg.drink
   when 5
    hedg.wc
   when 6
    hedg.bath
   when 7
    hedg.status
   when 8
     puts "1 - погодувати"
     puts "2 - погратись"
     puts "3 - покласти спати"
     puts "4 - напоїти"
     puts "5 - зводити в туалет"
     puts "6 - зводити в ванну"
     puts "7 - статистика"
     puts "8 - help"
     puts "9 - exit"
   end
 end
