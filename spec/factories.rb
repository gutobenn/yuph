FactoryGirl.define do
  factory :user do
    nick "victor-antoniazzi"
    email  "vgsantoniazzi@gmail.com"
    password "pass12345"
  end
  factory :full_user, :class => User do
    nick "victor-antoniazzi"
    email  "vgsantoniazzi@gmail.com"
    password "pass12345"
    image "test"
    about "hi, i am a softaew developer"
    local "Pelotas - RS"
    website "www.victorantoniazzi.com.br"
    facebook "fb.com/oi?"
    twitter "@antoniazzii"
  end
  factory :idea do
    name "art in vinil"
    image "iuaehiuae.jpg"
    mini_description "arte no vinil"
    description "arte no vinil"
  end
  factory :message do
    title "Como estás ?"
    body "Novidades ? Vamos implementar aquela idea?"
  end
  factory :user_comment do
    title "O cara"
    message "Várias idéias, várias cabeças"
  end
  factory :idea_comment do
    title "Muito Bacana!!"
    message "Adorei a iniciativa."
  end
  factory :forum do
    password ""
  end
  factory :idea_admin do
  end

end