hassecureid
===========

Using sequential object IDs as references is probably a bad idea. Why? Because if an attacker sees /user/2 then he knows that /user/1 exists.
Sure, you SHOULD have sufficient access control to where you don't care if the attacker knows /user/1 exists, but why offer the attack surface?

Use
---

    class User < ActiveRecord::Base
      has_secure_id
    end

In your migration make sure you add a string "secure_id"

     class CreateUser < ActiveRecord::Migration
       def self.up
         create_table :users do |t|
           t.string :secure_id
           t.string :name

           t.timestamps
         end
       end

       def self.down
         drop_table :users
       end
     end


When performing a find

    User.find_by_secure_id(params[:secure_id])

How it Works
------------

To be honest, the gem is brutally simple. It basically ensures that the secure_id cannot be overwritten with an update
and takes care of generating the secure_id.

The secure_id is an alphanumeric string with at least 128 bits of randomness (provided by SecureRandom in the standard library).
This is as much randomness as in a GUID.

As an additional perk, the string letters are selected to be difficult to confuse with one another (no 0, no O, etc).

I wrote this to basically keep myself from duplicating effort. I hope you find it useful as well.

Alan Shields
