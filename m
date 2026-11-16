Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819376;
	b=XRTkVS3f5hzHGp+kpyCOPcBt5nJ9LCeG0TR7bdAB40H5bReZKyXS7HJlhza3g4A47Cxt
	 N1QSlBRGMW2rwK+n11vOIjQhXMwo0tIKcLG5e3qWAM9pGfyJBgBTS8AGCjgFEPbkGfBR/
	 GmTrj0EjPNSnWttIX4xHl/6kKCygtNSW6ORc6xuGMTdYwP+NKxlWB377Wo2AIABBo50dO
	 OJVOMrcdqJxF3XYQ04bOQMD+z7rcVrX8cDND7n0jg5yaRbzywcBX9722wQiJgqDZThVTb
	 VC1u1CytgvWU8ghr+I8F5+mN2vyD6DlA8rC73XClE6M0kEWWGYJqpVIEe5uRKWIXVTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m7jLssS4b6/Hj/S1vChj9ooMCseYQvI7tiM2Tbkwxew=;
	b=fVV2exttWNqPXIY80EEjhpBZsltY7XsvqG/taL7ZqG82+x5d0iN8Vbun3WkU7tLoRJkE
	 IbR9wf5DrThLL6WCbSt6P/mr7eHy0FBR0aX0U4WxFJ+VqRKeiCkUiZJY7OHcZWkt2KHGl
	 jgSFYQmc2OkkniUeH533ma04jMnB2YX02y7kC3DaVTK5cZBX9+BvQOgE7FpnOwqmHUGAH
	 oCdZolo56oasUSUTM1A4DtMwNtrdr0cxYn2p1KWlb1g2kmgAYK+eIKCBCxtRxEqh3pNXp
	 fUEIRUB/qTWfTeY7EOvjFphj27C8c7cieGee3yJBGatF4VK5xHhatDwVEHkIQdhX3VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rNdGyrCt;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F650606A31C
	for <printk@lists.linux.dev>; Mon, 16 Nov 2026 08:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F650606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rNdGyrCt
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490a0e72588so1417196f8f.3
        for <printk@lists.linux.dev>; Mon, 16 Nov 2026 00:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819374; x=1795424174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7jLssS4b6/Hj/S1vChj9ooMCseYQvI7tiM2Tbkwxew=;
        b=rNdGyrCt/I/sDTG9kyh1SMxq48+xYnJM7DsYMor7I4LbrWokkaGZWy7IJZeC6W34Bg
         8XfG3DjzMjSt0pQK3YFYcI9qwkv4dXoIU1Rb9T173hzgFKWhfOxxBZR1bnVdsdLcTbcR
         1+uIdV2M0na/Y2jnuIEzopXiRaZGjpL56Vry4YP7Pi6D6jcKQBOEY/iLQfpZbMvDM5FU
         ePDwLQWPw4t34P7h5c0h6QOFcJNw+Znjam6tuJ9kXoCpL/zFiCTH19mRJoU7Kw6Z+Fzn
         4W5NaqhVc9Z7LKG2eGo0WwD/qLZUaJtAIzrVMFulCQTdq8AbEVmWqHWziOK323885ZHf
         vQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819374; x=1795424174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7jLssS4b6/Hj/S1vChj9ooMCseYQvI7tiM2Tbkwxew=;
        b=BkA4zgLZFPVk82YDZmrvIxBc5QvouyPs+Sap9gu57NpEJJchWp9BHlpagaa+ZJ/ZsB
         5HiyPlqpxKGT8mag1y42H3GYHG5Q9dJV1HTwUrzDDHZNJRHmWkMAZyrxd5/8rqoNhE/m
         uNYbNb9T13Nnw8jOTUyWWViQc07roVMbmdO/+Wybbm6fDjIyHfvfKX0NzyRA2y6fetwg
         1tcYWU34fp+8gSkMNebW2AJJipP4fKa8ndU/vh8HKw1K4JeAD7r3Zmv46HBEIwEBNcMK
         AA3i2ELcqhQS2iON2sxkjICGJUER45PR8qAmXMGO5QircpEflTEgFtngrTBoB4mkNrrQ
         tFqg==
X-Forwarded-Encrypted: i=1; AL+hErFuBbN8LMrbAlKOLvAe21XAQUJVuHNJXKNwdoSvfkIWcH/tVolR47C49ko6kTS1Vc7QII4oWpU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9mD9TS3IKMPSiTgfLy6qOfg/AHC4SnrwAWKiqBdZIPa1M4eCCZ
	M33v3cewpPFyKOi0dfAUBE9PLwXdv1ixLIUDldkTtqoibDuNirsz/wXz
X-Gm-Gg: AZFdTZdKnW0ErEBhF0y+BlS/jCnVTMNTkq+XmdvSvvLB47auMf/78+vhKjoEFzSQsmS
	MghhP/BURDA176uIVcpYJPddCwdQ4E2Uj6kkqj7/yfK1TQDOeIxuS3csiYyXQ4XWrVVwUQ+VdD6
	0olZDLi8Q7i+MBtFmzmLPsdVT4Wou86CJKnRAJNSMza9TJsxZ961Y9QfGaD3fGn120i13pT5y65
	28s2v5KFUjt26QsGL/yVoo70DjC5tG2cAkI0zkaTXe23ys1ZHkbxnQ2SPugzGmcOwLWcNTOUj4H
	TuYleUUm2iOFtrA2/RTS64bZophRCuoXG0FMqsYuVNW6Zs/VXNxL7CnTpcyW8pdllpS+y+9rO0a
	v16T0AV/sGN3fE2Zl3wJk/OoTvYxm+MVy/HBCtfJdrv72VPyxS12NNx4Oc19PafkIkxGXzAk02O
	LzQ7rK2rJguRg7eHcjdLpxfq2XcGjlMJGkMtXgAuj7Zo+YxkW/00XWPLZ67z5p5j4T//1NQ/+Hk
	kfl548VR5pOc+TzHwyopekr/kweRu7Y6sEPLC+mF/1YLamMxHO/wnpcbAKWatZIDt+XDfOY3+ui
	UwXSEwbOmdM3sdUXUfzgVJeWY6L2lMTsjJA=
X-Received: by 2002:a05:6000:220a:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-49c71d49137mr17428762f8f.29.1794819374287;
        Mon, 16 Nov 2026 00:56:14 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:1c3:e2b2:8068:e97d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm22439034f8f.45.2026.11.16.00.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:56:13 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Chris Down <chris@chrisdown.name>,
	Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] printk: Fix skipped entries after index iterator restart
Date: Mon, 16 Nov 2026 10:56:10 +0200
Message-ID: <20261116085609.476250-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

seq_read_iter() can advance the iterator before the next record
fits in the read buffer. When iteration resumes, pi_start() calls
pi_next() at the saved position and advances past the pending printk
index entry. As a result, index reads can silently omit formats.

Return the entry corresponding to the saved position without
advancing the iterator.

Fixes: 337015573718 ("printk: Userspace format indexing support")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/printk/index.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/index.c b/kernel/printk/index.c
index a6b27526baaf6..642640a36abe1 100644
--- a/kernel/printk/index.c
+++ b/kernel/printk/index.c
@@ -59,7 +59,7 @@ static void *pi_start(struct seq_file *s, loff_t *pos)
 	if (*pos == 0)
 		return SEQ_START_TOKEN;
 
-	return pi_next(s, NULL, pos);
+	return pi_get_entry(s->file->f_inode->i_private, *pos - 1);
 }
 
 /*

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

