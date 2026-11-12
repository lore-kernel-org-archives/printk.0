Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453287;
	b=q36sQbGkEzmecX/UCzpWBobxoqb6Fhc9Am84IiH2czevyXrovy+J1Us2BPUXp0pQJQfR
	 NnspmQTl6OWKJXzlyuBGcJ7ulRlRVvaDHG8LF0Jb59tTSLlAlNLEojaEdRyWSO7HeoHkK
	 /8OT4g8IAY7AnTULcKTe5CVohcg0CcVQPaj+uAeZ0hRBzTMrkETBjQQUGKrysnxQ+ZWag
	 Vh9kHl7GExmR4lRMWdLHeejSU2x5da6VQbF2YmwivHHI43InSq7oQEjuH2oUu4ah3Fw8S
	 gumPO2v2OIoNYeyLJqh6c/lZ7SKYPEINETqX68suLlLOa6wdV+fC09N2l6HQs6X3woQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453287;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/30VWyBplrHuByc3jnpm/ewinby2W6T19rzhjR/lb94=;
	b=E3nMC3uaZ1GfJi8PgeszcL1fi93vf/jsQRhVnBqANgkKtdSKgdsl+nQQ0skxVlj7cf66
	 5jRQEIJqu96BDMtO6/UjweB7j3MmV2ybRC7dei+CljosBWIWs2RTHwmdDsCc74ZSnGNFj
	 7aqaxfOORIg5e14DXbXmWUE/MB194iSuXqVy8BHkRoEEd6k5ddjz9CHOeh64ZgFIqYLoM
	 XGJ+/+2+9PrOXuIJAEij2Rh1eJo54Fgi74SgrQoGt7EZQuteT74V+bomN3/pBRir+jhPh
	 9F2UUV8lUW+vU1ZOHNkU1Rk22P3Kw8d0s3FJI7/y+SwelXXNL5wLHTSkSq79i8lzQ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ey1jhzMo;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C889606A323
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 03:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C889606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ey1jhzMo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Ey1jhzMoUiJ3GqO4Zw52/9rP5yP77vtL+oskHizqy+0Tsqp4q6nbD1HTIFU0pcqy3L3kBDOWaBW3s
	 eOaGCqKjmv7KZ9LqtVWUvwuOTpi+zr12xiiuq+/XyXkotKm9yK9pYkDL6uzwRx6/51LISbrRa72jY3
	 17evi/txqUCMBZq8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af52f232e1-ddd3f;
	Thu, 12 Nov 2026 11:14:44 +0800 (CST)
X-RM-TRANSID:2ee76af52f232e1-ddd3f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af52f225ed-f0845;
	Thu, 12 Nov 2026 11:14:44 +0800 (CST)
X-RM-TRANSID:2ee66af52f225ed-f0845
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: pmladek@suse.com
Cc: john.ogness@linutronix.de,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	paulmck@kernel.org,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH v2] printk: ringbuffer: Annotate speculative record reads
Date: Thu, 12 Nov 2026 11:14:41 +0800
Message-ID: <20261112031441.120773-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

Readers may copy a finalized record while a writer recycles its storage.
prb_read() checks the descriptor again after copying and rejects records
that have changed, but the plain metadata and text accesses still trigger
KCSAN reports.

Annotate the speculative copies, line counting and length read with
data_race(). Retain READ_ONCE() for text_len so that the size check and
copy use one snapshot. The descriptor validation continues to determine
whether the copied record can be used.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: b6cf8b3f3312 ("printk: add lockless ringbuffer")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
Changes in v2:
- Mark the speculative text_len snapshot with data_race(), retaining
  READ_ONCE() and documenting the reader-side validation.

 kernel/printk/printk_ringbuffer.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 46a79ec0940a..8a1075d00d0a 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1894,9 +1894,10 @@ static bool copy_data(struct prb_data_ring *data_ring,
 	if (data_size < (unsigned int)len)
 		return false;
 
-	/* Caller interested in the line count? */
-	if (line_count)
-		*line_count = count_lines(data, len);
+	if (line_count) {
+		/* Racing text is rejected by the caller's descriptor recheck. */
+		*line_count = data_race(count_lines(data, len));
+	}
 
 	/* Caller interested in the data content? */
 	if (!buf || !buf_size)
@@ -1904,7 +1905,7 @@ static bool copy_data(struct prb_data_ring *data_ring,
 
 	data_size = min_t(unsigned int, buf_size, len);
 
-	memcpy(&buf[0], data, data_size); /* LMM(copy_data:A) */
+	data_race(memcpy(&buf[0], data, data_size)); /* LMM(copy_data:A) */
 	return true;
 }
 
@@ -1969,6 +1970,7 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
 	atomic_long_t *state_var = &rdesc->state_var;
 	struct prb_desc desc;
 	unsigned long id;
+	u16 text_len;
 	int err;
 
 	/* Extract the ID, used to specify the descriptor to read. */
@@ -1984,12 +1986,16 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
 	if (err || !r)
 		return err;
 
-	/* If requested, copy meta data. */
-	if (r->info)
-		memcpy(r->info, info, sizeof(*(r->info)));
+	if (r->info) {
+		/* The record may be recycled; the descriptor is rechecked below. */
+		data_race(memcpy(r->info, info, sizeof(*r->info)));
+	}
+
+	/* The descriptor recheck below also rejects a raced length. */
+	text_len = data_race(READ_ONCE(info->text_len));
 
 	/* Copy text data. If it fails, this is a data-less record. */
-	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, info->text_len,
+	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, text_len,
 		       r->text_buf, r->text_buf_size, line_count)) {
 		return -ENOENT;
 	}
-- 
2.51.0



