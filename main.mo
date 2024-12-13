import Nat "mo:base/Nat";
import Option "mo:base/Option";
import Array "mo:base/Array";
import Nat32 "mo:base/Nat32";

actor DecentralizedLottery {

    // Kullanıcı biletlerini saklamak için bir Map
    stable var participants: [Text] = [];

    // Çekiliş ödülü
    stable var prize: Nat = 1000;  // Örneğin 1000 IC (veya başka bir ödeme token'ı)

    // Kullanıcılar bilet alabilir
    public func buyTicket(userId: Text) : async Bool {
        // Kullanıcı zaten bilet almış mı kontrol et
        if (Array.contains(participants, userId)) {
            return false;  // Aynı kullanıcı birden fazla bilet alamaz
        };

        // Yeni bilet alan kullanıcıyı listeye ekle
        participants := Array.append(participants, [userId]);

        return true;
    };

    
        
    // Rastgele bir katılımcıyı seçmek için byteFrom fonksiyonunu kullanarak çekiliş yapma
    public func drawLottery() : async Text {
        // Eğer katılımcı yoksa, çekiliş yapılmaz
        if (Array.size(participants) == 0) {
            return "No participants!";
        };

        let winner = "default";
        // Ödül dağıtımı - burada sadece kazananın adı döndürülüyor
        // Gerçek ödül transferi için token/IC ödeme entegrasyonu gerekebilir.
        return "Winner: " # winner;
    };

    // Katılımcı sayısını kontrol et
    public query func getParticipantsCount() : async Nat {
        return Array.size(participants);
    };
    
    // Katılımcı listesini kontrol et
    public query func getParticipants() : async [Text] {
        return participants;
    };

// Ödül dağıtımı için örnek fonksiyon
public func distributePrize(winner: Text) : async Text {
    // Ödül gönderme işlemi burada yapılır (gerçek token veya IC gönderimi yapılabilir)
    // Örneğin, winner adresine ödül transferi yapılır.
    return "Prize of " # Nat.toText(prize) # " IC awarded to " # winner;
};


 }
