player_hash =Hash[(1..3).to_a.collect {|k| ["x"+k.to_s,0]}+(1..3).to_a.collect {|k| ["y"+k.to_s,0]}+[["x+y",0],["x-y",0]]]
win_hash = [player_hash, player_hash.clone]
# print player_hash[0].object_id
# print "\n"
# print player_hash[1].object_id
y_str ="2"

win_hash[0]["y"+y_str]+=1
print "\n"
print win_hash
print '--------------------------------'
win_hash[1]["y"+y_str]+=1
print "\n"
print win_hash
print '--------------------------------'
win_hash[0]["y"+y_str]+=1
print "\n"
print win_hash
print '--------------------------------'